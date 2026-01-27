#!/usr/bin/env python3
"""
Check for ghost variables in Why3 goals.
A ghost variable is one that:
1. Is declared in the forall quantifier
2. Appears very few times (0-2) in the premises
3. Is used in the conclusion or critical parts
"""

import re
import sys
from pathlib import Path
from collections import defaultdict

def extract_goal_text(file_path, goal_name):
    """Extract the text of a specific goal from a file."""
    with open(file_path, 'r') as f:
        content = f.read()

    # Find the theory containing this goal
    pattern = rf'theory\s+VC{goal_name}\s+.*?goal\s+goal\d+:(.*?)end'
    match = re.search(pattern, content, re.DOTALL)
    if not match:
        return None
    return match.group(1)

def analyze_goal(goal_text):
    """Analyze a goal for ghost variables."""
    lines = goal_text.strip().split('\n')

    # Extract forall declarations
    forall_vars = []
    in_forall = False
    for line in lines:
        line = line.strip()
        if line.startswith('forall'):
            in_forall = True
        if in_forall:
            # Extract variable names
            # Pattern: "forall var1 var2 : type."
            match = re.findall(r'forall\s+([^:]+)\s*:', line)
            if match:
                vars_str = match[0]
                # Split by spaces and filter out types
                vars_list = [v.strip() for v in vars_str.split() if v.strip()]
                forall_vars.extend(vars_list)
            if line.endswith('.'):
                in_forall = False
                break

    # Count occurrences of each variable
    var_counts = defaultdict(int)

    # Split into premises and conclusion
    # Find the last "->" which typically separates premises from conclusion
    conclusion_start = -1
    for i in range(len(lines) - 1, -1, -1):
        if '->' in lines[i]:
            conclusion_start = i + 1
            break

    if conclusion_start == -1:
        return None

    premises_text = '\n'.join(lines[:conclusion_start])
    conclusion_text = '\n'.join(lines[conclusion_start:])

    # Count variable occurrences in premises
    for var in forall_vars:
        # Use word boundary to avoid partial matches
        count = len(re.findall(rf'\b{re.escape(var)}\b', premises_text))
        var_counts[var] = count

    # Find variables used in conclusion
    vars_in_conclusion = set()
    for var in forall_vars:
        if re.search(rf'\b{re.escape(var)}\b', conclusion_text):
            vars_in_conclusion.add(var)

    # Identify ghost variables: low premise count but used in conclusion
    ghost_vars = []
    for var in forall_vars:
        premise_count = var_counts[var]
        # Ghost if appears 0-2 times in premises but used in conclusion
        # OR appears 0 times in premises regardless
        if premise_count <= 2 and var in vars_in_conclusion:
            ghost_vars.append((var, premise_count))
        elif premise_count == 0:
            ghost_vars.append((var, premise_count))

    return {
        'forall_vars': forall_vars,
        'var_counts': dict(var_counts),
        'vars_in_conclusion': list(vars_in_conclusion),
        'ghost_vars': ghost_vars
    }

def check_file_goals(file_path, goal_patterns):
    """Check specific goals in a file."""
    results = []

    for goal_pattern in goal_patterns:
        goal_text = extract_goal_text(file_path, goal_pattern)
        if goal_text:
            analysis = analyze_goal(goal_text)
            if analysis and analysis['ghost_vars']:
                results.append({
                    'goal': goal_pattern,
                    'analysis': analysis
                })

    return results

# Test with known ghost variable goals
test_cases = [
    ('strcmp_Why3_ide.mlw', ['strcmp_post']),
    ('strpbrk_Why3_ide.mlw', ['strpbrk_found_post_3']),
    ('strchr_Why3_ide.mlw', ['strchr_exists_post', 'strchr_exists_post_2', 'strchr_exists_post_3']),
    ('strchrnul_Why3_ide.mlw', ['strchrnul_post', 'strchrnul_exists_post', 'strchrnul_not_exists_post', 'strchrnul_not_exists_post_2']),
    ('match_string_Why3_ide.mlw', ['match_string_exists_post', 'match_string_missing_post']),
]

base_dir = Path('/home/qiyuan/Current/NTP4Verif_fixing/iclr-NTP4Verif/data/why3/frama_c/verker')

for filename, goal_patterns in test_cases:
    file_path = base_dir / filename
    if not file_path.exists():
        print(f"File not found: {file_path}")
        continue

    print(f"\n{'='*80}")
    print(f"File: {filename}")
    print(f"{'='*80}")

    results = check_file_goals(file_path, goal_patterns)

    if results:
        for result in results:
            print(f"\nGoal: {result['goal']}")
            analysis = result['analysis']
            print(f"  All forall vars: {', '.join(analysis['forall_vars'][:10])}{'...' if len(analysis['forall_vars']) > 10 else ''}")
            print(f"  Ghost variables found:")
            for var, count in analysis['ghost_vars']:
                print(f"    - {var}: appears {count} times in premises")
    else:
        print("  No ghost variables found in checked goals")
