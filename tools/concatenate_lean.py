#!/bin/env python3
import os
import sys

if len(sys.argv) <= 1:
    print("Usage: python3 concatenate_lean.py <directories>")
    sys.exit(1)

target_path = sys.argv[1]

CODE_CHUNKS = {}
with open('generation/lean/Why3/Base.lean', 'r') as f:
    CODE_CHUNKS['Why3.Base'] = f.read() + '\nopen Classical\nopen Lean4Why3\n\n'

def load_code_chunk(module, vis):
    if module in CODE_CHUNKS:
        return CODE_CHUNKS[module]
    parts = module.split('.')
    if parts[0] == 'Why3':
        path = os.path.join('generation', 'lean', *parts) + '.lean'
    else:
        path = os.path.join('data', 'why3', *parts) + '.lean'
    return concate_file(path, vis)

def concate_file(path, vis):
    with open(path, 'r') as f:
        src = f.readlines()
    chunks = []
    for s in src:
        if s.startswith('import '):
            module = s.split(' ')[1].strip()
            if module in vis:
                continue
            vis.add(module)
            chunks.append(load_code_chunk(module, vis))
            continue
        if s.startswith('open '):
            continue
        chunks.append(s)
    ret = ''.join(chunks)
    CODE_CHUNKS[path] = ret
    cat_path = path.replace('/lean/', '/lean_standalone/')
    os.makedirs(os.path.dirname(cat_path), exist_ok=True)
    with open(cat_path, 'w') as f:
        f.write(ret)
    return ret

lean_files = []
for root, dirs, files in os.walk(target_path):
    for file in files:
        if file.endswith('.lean'):
            if 'lean_standalone' in root:
                continue
            if file == 'Benchmark.lean':
                continue
            file_path = os.path.join(root, file)
            lean_files.append(file_path)
        
for i, file_path in enumerate(lean_files):
    print(f"[{i}/{len(lean_files)}] Processing {file_path}")
    concate_file(file_path, set())

