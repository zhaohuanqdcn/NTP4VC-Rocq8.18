#!/usr/bin/env python3
"""
Systematically analyze all post-condition goals for ghost variables.
"""

import re
from pathlib import Path
from collections import defaultdict

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

def analyze_forall_vars(theory_content):
    """Extract forall variables and analyze their usage."""
    lines = theory_content.split('\n')

    # Find goal declaration
    goal_start = -1
    for i, line in enumerate(lines):
        if re.match(r'\s*goal\s+goal\d+:', line):
            goal_start = i
            break

    if goal_start == -1:
        return None

    goal_lines = lines[goal_start:]

    # Extract forall variables
    forall_vars = []
    i = 1  # Skip the "goal goalN:" line
    while i < len(goal_lines):
        line = goal_lines[i].strip()
        if line.startswith('forall'):
            # Extract variables: "forall var1 var2 ... varN : type."
            # May have period at end or not
            match = re.match(r'forall\s+(.*?)\s*:\s*', line)
            if match:
                vars_str = match.group(1)
                # Split by whitespace, remove empty strings
                vars_list = [v.strip() for v in vars_str.split() if v.strip()]
                forall_vars.extend(vars_list)
        elif line.startswith('let') or (line and not line.startswith('forall') and line != ''):
            # End of forall declarations
            break
        i += 1

    if not forall_vars:
        return None

    # Find the start of premises (after let declarations)
    premise_start = i
    while premise_start < len(goal_lines) and goal_lines[premise_start].strip().startswith('let'):
        premise_start += 1

    # Find the last premise (last line with ->)
    last_arrow = -1
    for i in range(len(goal_lines) - 1, -1, -1):
        if '->' in goal_lines[i]:
            last_arrow = i
            break

    if last_arrow == -1:
        return None

    premises_text = '\n'.join(goal_lines[premise_start:last_arrow + 1])
    conclusion_text = '\n'.join(goal_lines[last_arrow + 1:])

    # Count variable occurrences in premises
    var_counts = {}
    for var in forall_vars:
        # Use word boundary regex
        count = len(re.findall(rf'\b{re.escape(var)}\b', premises_text))
        var_counts[var] = count

    # Check which variables appear in conclusion
    vars_in_conclusion = set()
    for var in forall_vars:
        if re.search(rf'\b{re.escape(var)}\b', conclusion_text):
            vars_in_conclusion.add(var)

    # Identify potential ghost variables
    # Ghost if: appears 0 times in premises OR appears 0-1 times and used in conclusion
    ghost_candidates = []
    for var in forall_vars:
        premise_count = var_counts[var]
        in_conclusion = var in vars_in_conclusion

        if premise_count == 0:
            ghost_candidates.append((var, premise_count, in_conclusion))
        elif premise_count <= 1 and in_conclusion:
            ghost_candidates.append((var, premise_count, in_conclusion))

    return {
        'forall_vars': forall_vars,
        'var_counts': var_counts,
        'vars_in_conclusion': sorted(vars_in_conclusion),
        'ghost_candidates': ghost_candidates
    }

# List of goals to check
goals_to_check = [
    ('strcmp_Why3_ide.mlw', 'VCstrcmp_post'),
    ('strpbrk_Why3_ide.mlw', 'VCstrpbrk_post'),
    ('strpbrk_Why3_ide.mlw', 'VCstrpbrk_found_post'),
    ('strpbrk_Why3_ide.mlw', 'VCstrpbrk_found_post_2'),
    ('strpbrk_Why3_ide.mlw', 'VCstrpbrk_found_post_3'),
    ('strpbrk_Why3_ide.mlw', 'VCstrpbrk_not_found_post'),
    ('strchr_Why3_ide.mlw', 'VCstrchr_exists_post'),
    ('strchr_Why3_ide.mlw', 'VCstrchr_exists_post_2'),
    ('strchr_Why3_ide.mlw', 'VCstrchr_exists_post_3'),
    ('strchr_Why3_ide.mlw', 'VCstrchr_not_exists_post'),
    ('strchrnul_Why3_ide.mlw', 'VCstrchrnul_post'),
    ('strchrnul_Why3_ide.mlw', 'VCstrchrnul_exists_post'),
    ('strchrnul_Why3_ide.mlw', 'VCstrchrnul_not_exists_post'),
    ('strchrnul_Why3_ide.mlw', 'VCstrchrnul_not_exists_post_2'),
    ('match_string_Why3_ide.mlw', 'VCmatch_string_exists_post'),
    ('match_string_Why3_ide.mlw', 'VCmatch_string_missing_post'),
    ('strlen_Why3_ide.mlw', 'VCstrlen_post_2'),
    ('strlen_Why3_ide.mlw', 'VCstrlen_post_3'),
    ('strnlen_Why3_ide.mlw', 'VCstrnlen_count_len_post'),
    ('strnlen_Why3_ide.mlw', 'VCstrnlen_null_byte_post'),
    ('strncmp_Why3_ide.mlw', 'VCstrncmp_len_diff_post_2'),
    ('strspn_Why3_ide.mlw', 'VCstrspn_post_2'),
    ('strspn_Why3_ide.mlw', 'VCstrspn_post_3'),
]

base_dir = Path('/home/qiyuan/Current/NTP4Verif_fixing/iclr-NTP4Verif/data/why3/frama_c/verker')

print("="*80)
print("Analyzing Post-Condition Goals for Ghost Variables")
print("="*80)

ghost_var_goals = []

for filename, theory_name in goals_to_check:
    file_path = base_dir / filename
    if not file_path.exists():
        continue

    theory_content = extract_theory_content(file_path, theory_name)
    if not theory_content:
        print(f"WARNING: Could not extract theory {theory_name} from {filename}")
        continue

    analysis = analyze_forall_vars(theory_content)
    if not analysis:
        print(f"WARNING: Could not analyze {theory_name} from {filename}")
        continue

    if analysis['ghost_candidates']:
        print(f"\n{filename} :: {theory_name}")
        print(f"  Forall vars: {', '.join(analysis['forall_vars'][:15])}{'...' if len(analysis['forall_vars']) > 15 else ''}")
        print(f"  Ghost variable candidates:")
        for var, count, in_conclusion in analysis['ghost_candidates']:
            status = "in conclusion" if in_conclusion else "not in conclusion"
            print(f"    * {var}: {count} times in premises, {status}")

        ghost_var_goals.append({
            'file': filename,
            'theory': theory_name,
            'ghost_vars': analysis['ghost_candidates']
        })

print(f"\n{'='*80}")
print(f"SUMMARY: Found {len(ghost_var_goals)} goals with potential ghost variables")
print(f"{'='*80}")

for item in ghost_var_goals:
    ghost_list = ', '.join([f"{v}({c})" for v, c, _ in item['ghost_vars']])
    print(f"{item['file']:40s} :: {item['theory']:40s} : {ghost_list}")
