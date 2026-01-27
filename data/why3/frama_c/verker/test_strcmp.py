#!/usr/bin/env python3
import re
from pathlib import Path

def extract_theory_content(file_path, theory_name):
    with open(file_path, 'r') as f:
        content = f.read()
    pattern = rf'theory\s+{re.escape(theory_name)}\s+(.*?)^end'
    match = re.search(pattern, content, re.DOTALL | re.MULTILINE)
    if match:
        return match.group(1)
    return None

file_path = Path('/home/qiyuan/Current/NTP4Verif_fixing/iclr-NTP4Verif/data/why3/frama_c/verker/strcmp_Why3_ide.mlw')
theory_content = extract_theory_content(file_path, 'VCstrcmp_post')
lines = theory_content.split('\n')

goal_start = -1
for i, line in enumerate(lines):
    if re.match(r'\s*goal\s+goal\d+:', line):
        goal_start = i
        break

goal_lines = lines[goal_start:]

# Extract forall
forall_vars = []
i = 1
while i < len(goal_lines):
    line = goal_lines[i].strip()
    print(f"{i}: {line[:80]}")
    if line.startswith('forall'):
        match = re.match(r'forall\s+(.*?)\s*:\s*', line)
        if match:
            vars_str = match.group(1)
            print(f"   -> Extracted vars: {vars_str}")
            vars_list = [v.strip() for v in vars_str.split()]
            forall_vars.extend(vars_list)
    elif line.startswith('let'):
        print("   -> Hit let, stopping")
        break
    i += 1

print(f"\nAll forall vars: {forall_vars}")

# Count p and p_1 in premises
premise_start = i
last_arrow = -1
for i in range(len(goal_lines) - 1, -1, -1):
    if '->' in goal_lines[i]:
        last_arrow = i
        break

print(f"\nPremise lines: {premise_start} to {last_arrow}")
premises_text = '\n'.join(goal_lines[premise_start:last_arrow + 1])
conclusion_text = '\n'.join(goal_lines[last_arrow + 1:])

for var in ['p', 'p_1']:
    count_premises = len(re.findall(rf'\b{re.escape(var)}\b', premises_text))
    count_conclusion = len(re.findall(rf'\b{re.escape(var)}\b', conclusion_text))
    print(f"{var}: {count_premises} in premises, {count_conclusion} in conclusion")

print("\n=== Conclusion text ===")
print(conclusion_text[:500])
