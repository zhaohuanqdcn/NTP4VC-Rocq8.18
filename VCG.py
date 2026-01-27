#!/bin/env python3
from NTP4Verif import Exporter, ADDITIONAL_LOADING_PATHS
import glob
import os
import sys
import argparse
import logging
import queue
import threading

# Simple logger setup
logging.basicConfig(
    level=logging.INFO,
    format='%(levelname)s: %(message)s',
    handlers=[logging.StreamHandler()]
)
logger = logging.getLogger('VCG')

def find_mlw_files(path):
    """Find .mlw files in the given path. If path is a file, return it if it's a .mlw file."""
    if os.path.isfile(path):
        if path.endswith('.mlw'):
            return [path]
        return []
    elif os.path.isdir(path):
        return glob.glob(os.path.join(path, '**', '*.mlw'), recursive=True)
    return []

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process Why3 files and generate verification conditions.')
    parser.add_argument('language', help='Target language for code generation')
    parser.add_argument('-L', '--loading-paths', nargs='*', default=[],
                      help='Optional paths to search for Why3 files')
    parser.add_argument('-c', '--cache', default=None,
                      help='Optional cache database file')
    parser.add_argument('-p', '--parallel', type=int, default=None,
                      help='Optional number of parallel threads')
    parser.add_argument('paths', nargs='+', help='Paths to process (can be .mlw files or directories)')
    parser.add_argument('-s', '--statistics', default=None,
                      help='Optional statistics database file')
    # Custom argument parsing to ensure language comes before paths
    args = sys.argv[1:]
    if len(args) < 2:
        parser.print_help()
        sys.exit(1)
        
    # Find the first argument that's not a flag (starts with -)
    language_idx = next((i for i, arg in enumerate(args) if not arg.startswith('-')), None)
    if language_idx is None:
        parser.print_help()
        sys.exit(1)
        
    # Move language to the front
    language = args.pop(language_idx)
    args.insert(0, language)
    
    # Now parse the reordered arguments
    args = parser.parse_args(args)
    
    sys.setrecursionlimit(3000)
    
    for path in args.loading_paths:
        ADDITIONAL_LOADING_PATHS.append('-L')
        ADDITIONAL_LOADING_PATHS.append(path)

    cache = args.cache
    # Process each path
    cache_db = None
    if cache is not None:
        from sqlitedict import SqliteDict
        cache_db = SqliteDict(cache)
    STATISTICS = None
    if args.statistics is not None:
        from sqlitedict import SqliteDict
        STATISTICS = SqliteDict(args.statistics)

    try:
        tasks = queue.Queue()
        id = 0
        task_num = 0
        for path in args.paths:
            if not os.path.exists(path):
                logger.error(f"Error: {path} does not exist")
                sys.exit(1)
            mlw_files = find_mlw_files(path)
            if not mlw_files:
                if os.path.isfile(path):
                    logger.error(f"Error: {path} is not a .mlw file")
                else:
                    logger.warning(f"No MLW files found in path: {path}")
                continue
                
            for mlw_file in mlw_files:
                tasks.put((id, mlw_file))
                id += 1
                task_num += 1
        def worker():
            while True:
                try:
                    (id, mlw_file) = tasks.get(timeout=0.1)
                except queue.Empty:
                    return
                    
                logger.info(f"\x1b[32;49m[{id}/{task_num}]\x1b[0m Processing {mlw_file}")
                Exporter.VCG(args.language, mlw_file, cache_db=cache_db, statistics=STATISTICS)
                # try:
                #     Exporter.VCG(mlw_file)
                # except Exception as e:
                #     logger.error(f"Failed to process {mlw_file}: {str(e)}")
                #     sys.exit(1)
        para_num = args.parallel
        if para_num is None:
            match args.language:
                case 'isabelle':
                    para_num = 1
                case 'lean':
                    para_num = 8
                case 'rocq':
                    para_num = 4
                case _:
                    logger.error(f"Unknown language: {args.language}")
                    sys.exit(1)
        threads = [threading.Thread(target=worker) for _ in range(para_num)]
        for thread in threads:
            thread.start()
        for thread in threads:
            thread.join()
    finally:
        if cache_db:
            cache_db.close()
        if STATISTICS is not None:
            import csv
            import json

            data = {}
            const_deps = {}
            thy_deps = {}
            for key, value in STATISTICS.items():
                if "$" in key:
                    if key.startswith("const$"):
                        _, _, const = key.split("$")
                        if const not in const_deps:
                            const_deps[const] = set()
                        const_deps[const].update(value)
                    elif key.startswith("thy$"):
                        _, thy = key.split("$")
                        if thy not in thy_deps:
                            thy_deps[thy] = set()
                        thy_deps[thy].update(value)
                    else:
                        pass
                else:
                    file, case = key.split(":")
                    if file not in data:
                        data[file] = {}
                    data[file][case] = value
            with open("meta-data.csv", "w", newline="") as csvfile:
                writer = csv.writer(csvfile)
                # Write header
                writer.writerow(["key", "size", "quantifier alternation", "depth", "count of unique symbols", "constant dependencies"])
                for key, cases in data.items():
                    writer.writerow([key, cases["size"], cases["quant_alt"], cases["depth"], cases["unique_symbols"],\
                        ', '.join(cases["constant_dependencies"])])
            with open("constant-deps.json", "w") as jsonfile:
                # Convert sets to lists for JSON serialization
                const_deps_serializable = {k: list(v) for k, v in const_deps.items()}
                json.dump(const_deps_serializable, jsonfile)
            with open("thy-deps.json", "w") as jsonfile:
                # Convert sets to lists for JSON serialization
                thy_deps_serializable = {k: list(v) for k, v in thy_deps.items()}
                json.dump(thy_deps_serializable, jsonfile)
            
            STATISTICS.close()
    
