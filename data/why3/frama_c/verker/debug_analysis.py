#!/usr/bin/env python3
import re
from pathlib import Path

def extract_theory_content(file_path, theory_name):
    """Extract the content of a specific theory."""
    with open(file_path, 'r') as f:
        content = f.read()

    # Match theory ... end block
    pattern = rf'theory\s+{re.escape(theory_name)}\s+(.*?)^end'
    match = re.search(pattern, content, re.DOTALL | re.MULTILINE)
    if match:
        return match.group(1)
    return None

file_path = Path('/home/qiyuan/Current/NTP4Verif_fixing/iclr-NTP4Verif/data/why3/frama_c/verker/strcmp_Why3_ide.mlw')
theory_content = extract_theory_content(file_path, 'VCstrcmp_post')

if theory_content:
    print("=== Theory content extracted ===")
    lines = theory_content.split('\n')

    # Find goal start
    for i, line in enumerate(lines):
        if re.match(r'\s*goal\s+goal\d+:', line):
            print(f"\nGoal starts at line {i}: {line}")
            # Print next 30 lines
            for j in range(i, min(i+30, len(lines))):
                print(f"{j:3d}: {lines[j]}")
            break
else:
    print("Failed to extract theory")
