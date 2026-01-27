# Ghost Variables Analysis Report

## Summary

This report documents all verification goals in the verker benchmark that contain **ghost variables** - variables that are:
1. Declared in the `forall` quantifier
2. Appear in the goal (either premises or conclusion)
3. But are either unconstrained or barely constrained in the premises

## Confirmed Ghost Variable Goals

### 1. strcmp_Why3_ide_VCstrcmp_post_goal0
**File:** `data/why3/frama_c/verker/strcmp_Why3_ide.mlw`
**Theory:** `VCstrcmp_post`
**Goal:** `goal0`

**Ghost Variables:**
- `p` : bool
- `p_1` : bool

**Analysis:**
- Declared in line: `forall p_1 p : bool.`
- These variables appear ONLY in one if-then-else premise:
  ```
  (if (x_7 = x_8) then ((i_1 = 0) /\ (x_7 = 0))
   else ((p=False) /\ (p_1=False) /\ ...))
  ```
- They are set to `False` in the else branch but have no other constraints
- They do not appear in the final conclusion `(x = i_1)`
- **Impact:** These are unconstrained boolean variables that serve no purpose in the verification

---

### 2. strpbrk_Why3_ide_VCstrpbrk_found_post_3_goal21
**File:** `data/why3/frama_c/verker/strpbrk_Why3_ide.mlw`
**Theory:** `VCstrpbrk_found_post_3`
**Goal:** `goal21`

**Ghost Variables:**
- `a_5` : addr

**Analysis:**
- Declared in line: `forall a_9 a_8 a_7 a_6 a_5 a_4 a_3 a_2 a_1 a : addr.`
- Variable `a_5` appears ONLY in the conclusion, specifically in the else branch of an if-then-else:
  ```
  else ((a_2 = a_1) /\ (a_5 = a_4) /\ (x_1 <> 0) /\ (x_2 = x_1) /\
        ((addr_le a_3 a)) /\ ((addr_le a_5 a_2)) /\
        ...
        ((addr_lt a_2 ((shift_sint8 a_5 ((l_strlen t_1 a_5)))))) /\
        ...)
  ```
- It does NOT appear in any premise before the final if-then-else
- **Impact:** This is an address variable that is used in the postcondition but has no constraints from the premises, making it a ghost variable

---

## Methodology

The analysis was performed by:
1. Identifying all post-condition goals in the manifest
2. For each goal, extracting the forall-quantified variables
3. Counting occurrences of each variable in:
   - Premises (all lines with `->` except the final conclusion)
   - Conclusion (the final statement after the last `->`)
4. Flagging variables that:
   - Appear 0 times in premises, OR
   - Appear 0-1 times in premises and are used in conclusion, OR
   - Are set to constant values (like `False`) without other constraints

## Impact on Verification

Ghost variables can cause several issues:
1. **Undefined behavior:** Variables without constraints can take any value
2. **Unprovable goals:** Provers may fail because they cannot determine valid values
3. **False positives:** Goals might be "proved" with arbitrary variable assignments
4. **Translation errors:** Often indicate issues in the VCG translation process

## Recommendations

1. **For strcmp_post_goal0:** Remove variables `p` and `p_1` from the forall declaration, or add proper constraints
2. **For strpbrk_found_post_3_goal21:** Add premises that constrain `a_5`, or verify if it should be existentially quantified instead
3. **General:** Review the VCG generation process to prevent introduction of unconstrained universally quantified variables

## Files Analyzed

Systematically checked all post-condition goals in:
- `strcmp_Why3_ide.mlw` - 1 post goal ✓
- `strpbrk_Why3_ide.mlw` - 5 post goals ✓
- `strchr_Why3_ide.mlw` - 4 post goals ✓
- `strchrnul_Why3_ide.mlw` - 4 post goals ✓
- `match_string_Why3_ide.mlw` - 2 post goals ✓
- `strlen_Why3_ide.mlw` - 2 post goals ✓
- `strnlen_Why3_ide.mlw` - 2 post goals ✓
- `strncmp_Why3_ide.mlw` - 1 post goal ✓
- `strspn_Why3_ide.mlw` - 2 post goals ✓
- Other verker files with post-condition goals

## Total Ghost Variable Goals Found

**2 confirmed goals with ghost variables:**
1. `strcmp_Why3_ide_VCstrcmp_post_goal0` - variables: `p`, `p_1`
2. `strpbrk_Why3_ide_VCstrpbrk_found_post_3_goal21` - variable: `a_5`

---

*Report generated: 2026-01-09*
*Analysis performed on: iclr-NTP4Verif/data/why3/frama_c/verker*
