#!/bin/bash

# Find ghost variables by manually extracting goals from files

echo "=== Checking strcmp_Why3_ide.mlw goal0 ==="
echo "Variables p, p_1 appear in:"
grep -n "\\bp\\b\\|\\bp_1\\b" /home/qiyuan/Current/NTP4Verif_fixing/iclr-NTP4Verif/data/why3/frama_c/verker/strcmp_Why3_ide.mlw | grep -A 5 -B 5 "theory VCstrcmp_post" | head -20

echo ""
echo "=== Checking strpbrk_Why3_ide.mlw goal21 ==="
# Extract theory VCstrpbrk_found_post_3
sed -n '/theory VCstrpbrk_found_post_3/,/^end$/p' /home/qiyuan/Current/NTP4Verif_fixing/iclr-NTP4Verif/data/why3/frama_c/verker/strpbrk_Why3_ide.mlw | head -60

