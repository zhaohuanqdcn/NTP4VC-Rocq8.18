#!/usr/bin/env python3
import os
import subprocess
import re
import logging
import NTP4Verif.base as NTP4V
from NTP4Verif.base import logger
from sqlitedict import SqliteDict
import glob
import time
import threading
import queue
import json
import csv

class Why3Error(Exception):
    pass
class Why3Timeout(Why3Error):
    pass

# Read environment variable for additional Why3 load paths
WHY3_LOAD_ORIGIN = os.environ.get('WHY3_LOAD', '')
WHY3_LOAD = []
for x in WHY3_LOAD_ORIGIN.split(':'):
    if x:
        WHY3_LOAD.append('-L')
        WHY3_LOAD.append(x)

def run_strategy(file, strategy, timeout, db=None, goal_collections=None):
    file = os.path.relpath(file)
    file_name = os.path.splitext(os.path.basename(file))[0]
    dir = os.path.dirname(file)
    session_dir = os.path.join(dir, file_name)
    if os.path.exists(session_dir):
        for root, dirs, files in os.walk(session_dir, topdown=False):
            for name in files:
                os.remove(os.path.join(root, name))
            for name in dirs:
                os.rmdir(os.path.join(root, name))
        os.rmdir(session_dir)
    cmd = ['why3', 'session', 'create', '-o', session_dir, file]
    result = subprocess.run(cmd, capture_output=True, text=True)

    if result.returncode != 0:
        raise Why3Error(f"why3 session create failed with return code {result.returncode}")
    
    if dir in ['data/why3/examples', 'data/why3/no-lemma5', 'data/why3/common']:
        cmd = ['why3', 'shell', file] + WHY3_LOAD
    else:
        cmd = ['why3', 'shell', '-L', dir, file] + WHY3_LOAD

    print(' '.join(cmd))
    #file = os.path.relpath(file)
    process = subprocess.Popen(cmd, 
                                stdin=subprocess.PIPE,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.DEVNULL)
    
    def dump_error():
        stderr = process.stderr.read().decode()
        if stderr:
            print("Error output from why3:")
            print(stderr)
    
    # 使用线程和队列实现超时读取
    line_queue = queue.Queue()
    
    def read_thread():
        try:
            while True:
                line = process.stdout.readline().decode('utf-8', errors='replace').strip()
                if line:
                    line_queue.put(line)
                elif process.poll() is not None:
                    break
        except Exception as e:
            line_queue.put(e)
    
    # 启动读取线程
    reader_thread = threading.Thread(target=read_thread, daemon=True)
    reader_thread.start()
    
    def read_line():
        try:
            line = line_queue.get(timeout=1.0)  # 1秒超时
            if not line and process.poll() is not None:
                dump_error()
                raise Why3Error(f"why3 shell process terminated unexpectedly with return code {process.returncode}")
            if isinstance(line, Exception):
                raise line
            return line
        except queue.Empty:
            return ''
    def read_timeout(timeout):
        if db is not None:
            db[file] = (0, 0, timeout)
            db.commit()
        raise Why3Timeout(f"why3 fail to load {file} in {timeout} seconds")

    def read_until_start():
        start_time = time.time()
        while True:
            line = read_line()
            if line.endswith("OH!MY#GOD$I'M^GOING&TO*START"):
                break
            if time.time() - start_time > 30:
                read_timeout(30)
    def read_until_DONE():
        start_time = time.time()
        while True:
            line = read_line()
            if line.endswith("NICE!I!HAVE!DONE"):
                break
            if time.time() - start_time > 30:
                read_timeout(30)
    def read_state_json():
        start_time = time.time()
        read_until_start()
        buffer = []
        while True:
            line = read_line()
            if time.time() - start_time > 30:
                read_timeout(30)
            if line.endswith("OH!MY#GOD$I'HAVE!FINISHED"):
                break
            elif line:
                buffer.append(line)
        return json.loads(''.join(buffer))

    initial_state = read_state_json()
    goals = []
    goal_names = {}
    taken_name = set()
    def deconflict_name(name):
        if name in taken_name:
            i = 1
            while f"{name}{i}" in taken_name:
                i += 1
            name = f"{name}{i}"
        taken_name.add(name)
        return name
    def collect_goals(node, path=None):
        if path is None:
            path = []
        match node['type']:
            case 'Goal':
                name = node['name']
                if ' [VC for' in name:
                    name = name.split(' [VC for')[0]
                id = int(node['id'])
                path.append(NTP4V.alpnum_name(name))
                goals.append(id)
                name = deconflict_name('_'.join(path))
                goal_names[id] = name
                path.pop()
            case _:
                if 'sub' in node:
                    if node['type'] == 'File' and node['name'].endswith('.mlw'):
                        path.append(NTP4V.alpnum_name(node['name'][:-4]))
                    else:
                        path.append(NTP4V.alpnum_name(node['name']))
                    for sub in node['sub']:
                         collect_goals(sub, path)
                    path.pop()
    collect_goals(initial_state)

    if goal_collections is not None:
        goal_collections[file] = goal_names.values()

    if not strategy:
        return
    try:
        results = {}
        logger.info(f"Attacking {len(goals)} goals in {file}: {', '.join(goal_names.values())}")
        start_time = time.time()
        process.stdin.write(f"goto 1\n".encode())
        process.stdin.flush()
        read_until_DONE()
        process.stdin.write(f"{strategy}\n".encode())
        process.stdin.flush()


        while len(results) < len(goals) and all(v is not None for v in results.values()):
            line = read_line()
            match = re.match(r".*OH!MY!GOD!NODE!(\d+)!FINISHED!([P|X|Q])$", line)
            if match:
                id = int(match.group(1))
                match match.group(2):
                    case 'P' if id in goal_names:
                        logger.info(f"Goal {goal_names[id]} is proven successfully")
                        results[id] = True
                        if db is not None:
                            db[f"{file}:{goal_names[id]}"] = True
                    case 'X' if id in goal_names:
                        logger.info(f"Goal {goal_names[id]} fails to be proven")
                        results[id] = False
                        if db is not None:
                            db[f"{file}:{goal_names[id]}"] = False
                    case 'Q' if id < len(goals):
                        id = goals[id]
                        logger.info(f"Goal {goal_names[id]} fails to be proven")
                        results[id] = False
                        if db is not None:
                            db[f"{file}:{goal_names[id]}"] = False
                    case _:
                        pass
            elif time.time() - start_time > timeout:
                for (id, name) in goal_names.items():
                    if id not in results:
                        logger.info(f"Goal {name} is not proven after {timeout} seconds")
                        results[id] = False
                        if db is not None:
                            db[f"{file}:{name}"] = False
                break
        end_time = time.time()
        elapsed_time = end_time - start_time
        passed_count = sum(1 for v in results.values() if v)
        total_count = len(results)
        if db is not None:
            db[file] = (passed_count, total_count, elapsed_time)
            db.commit()
        return (passed_count, total_count, elapsed_time)
    finally:
        process.stdin.close()
        process.terminate()
        process.wait()

def run_files_and_directories(paths, strategy, timeout, db_path):
    files_to_process = []
    
    # Collect all .mlw files first
    for path in paths:
        if os.path.isfile(path):
            if path.endswith('.mlw'):
                files_to_process.append(path)
        elif os.path.isdir(path):
            files_to_process.extend(glob.glob(os.path.join(path, '**/*.mlw'), recursive=True))
        else:
            logger.error(f"Path {path} does not exist")
            
    passed = 0
    total = 0
    passed_file = 0
    total_file = 0
    # Process collected files
    goal_collections = {}

    with SqliteDict(db_path) as db:
        for (i,file) in enumerate(files_to_process):
            file = os.path.relpath(file, os.getcwd())
            if strategy is None:
                logger.info(f"[{i}/{len(files_to_process)}] Dumpling manifest for {file}")
                try:
                    run_strategy(file, None, timeout, db, goal_collections)
                except Why3Error as e:
                    logger.error(f"Error: {e}")
                    continue
                continue
            if file in db:
                run_strategy(file, None, timeout, db, goal_collections)
                passed_count, total_count, elapsed_time = db[file]
            else:
                try:
                    passed_count, total_count, elapsed_time = run_strategy(file, strategy, timeout, db, goal_collections)
                except Why3Error as e:
                    logger.error(f"why3 error: {e}")
                    continue
            if total_count == 0: # Invalid case
                continue
            passed += passed_count
            total += total_count
            if total > 0:
                succ_rate = passed / total * 100
            else:
                succ_rate = 0
            if total_count > 0:
                local_rate = i/len(files_to_process) * 100
            else:
                local_rate = 0
            if passed_count == total_count:
                passed_file += 1
            total_file += 1
            if total_file > 0:
                file_rate = passed_file / total_file * 100
            else:
                file_rate = 0
            if passed_count == total_count:
                logger.info(f"[{local_rate:.3f}%:{i}/{len(files_to_process)}, succ {succ_rate:.3f}%, file {file_rate:.3f}%] File {file} is proven successfully in {elapsed_time:.2f} seconds")
            else:
                logger.info(f"[{local_rate:.3f}%:{i}/{len(files_to_process)}, succ {succ_rate:.3f}%, file {file_rate:.3f}%] File {file} fails to be proven in {elapsed_time:.2f} seconds")

        with open(f"{db_path}.csv", "w") as csv_file:
            csv_writer = csv.writer(csv_file)
            for file, goals in goal_collections.items():
                for goal in goals:
                    if f"{file}:{goal}" in db:
                        csv_writer.writerow([file, goal, db[f"{file}:{goal}"]])
                    else:
                        csv_writer.writerow([file, goal, None])


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='Run Why3 auto level 3 on files and directories')
    parser.add_argument('paths', nargs='+', help='Paths to process (files or directories)')
    parser.add_argument('-t', '--tactic', default='Auto_level_3', 
                       help='Tactic to use (default: Auto_level_3)')
    parser.add_argument('--timeout', type=int, default=600,
                       help='Timeout in seconds (default: 600)')
    parser.add_argument('-d', '--db', default='./results/why3_auto_3.db',
                       help='Path to result database (default: ./results/why3_auto_3.db)')
    
    args = parser.parse_args()
    strategy = args.tactic if args.tactic else None
    if strategy == 'none':
        strategy = None
    run_files_and_directories(args.paths, strategy, args.timeout, args.db)
