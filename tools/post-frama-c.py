#!/usr/bin/env python3
import sys
import os
import re

def process(file):
    with open(file, 'r') as f:
        lines = f.readlines()
    
    mode = 0
    goal_id = 0
    with open(file, 'w') as f:
        for line in lines:
            if re.match(r'^\s*goal\s+WP.*', line):
                f.write("(*\n")
                mode = 1
            f.write(line)
            if mode == 1 and re.match(r'.*:$', line):
                f.write("*)\n")
                f.write(f"goal goal{goal_id}:\n")
                goal_id += 1
                mode = 0

if len(sys.argv) < 2:
    print("The path to the directory of mlw files is required")
    sys.exit(1)

path = sys.argv[1]

os.system(r"""find """ + path + r""" -name "*.why" -exec sh -c 'mv "$1" "${1%.why}.mlw"' _ {} \;""")

for root, dirs, files in os.walk(path):
    for file in files:
        if file.endswith('.mlw'):
            path = os.path.join(root, file)
            process(path)
