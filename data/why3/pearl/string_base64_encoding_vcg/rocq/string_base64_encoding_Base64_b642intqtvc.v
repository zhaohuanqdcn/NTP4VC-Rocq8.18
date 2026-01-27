From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.string.StringBuffer.
Open Scope Z_scope.
Definition int2b64 (i : Z) : ascii := if decide (0%Z ≤ i ∧ i ≤ 25%Z) then Ascii.ascii_of_nat (Z.to_nat (i + 65%Z)) else if decide (26%Z ≤ i ∧ i ≤ 51%Z) then Ascii.ascii_of_nat (Z.to_nat (i - 26%Z + 97%Z)) else if decide (52%Z ≤ i ∧ i ≤ 61%Z) then Ascii.ascii_of_nat (Z.to_nat (i - 52%Z + 48%Z)) else if decide (i = 62%Z) then Ascii.ascii_of_nat 43%nat else if decide (i = 63%Z) then Ascii.ascii_of_nat 47%nat else Ascii.ascii_of_nat 0%nat.
Definition valid_b64_char (c : ascii) := 65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 90%Z ∨ 97%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 122%Z ∨ 48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 57%Z ∨ Z.of_nat (Ascii.nat_of_ascii c) = 43%Z ∨ Z.of_nat (Ascii.nat_of_ascii c) = 47%Z.
Definition b642int (c : ascii) : Z := if decide (65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 90%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 65%Z else if decide (97%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 122%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 97%Z + 26%Z else if decide (48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 57%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 48%Z + 52%Z else if decide (Z.of_nat (Ascii.nat_of_ascii c) = 43%Z) then 62%Z else if decide (Z.of_nat (Ascii.nat_of_ascii c) = 47%Z) then 63%Z else if decide (c = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) then 0%Z else 64%Z.
Theorem b642int'vc (c : ascii) (q1' : bv 63%N) (o1 : bool) (fact0 : valid_b64_char c ∨ c = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) (fact1 : bv_signed q1' = Z.of_nat (Ascii.nat_of_ascii c)) (fact2 : if decide (65%Z ≤ bv_signed q1') then o1 = (if decide (bv_signed q1' ≤ 90%Z) then true else false) else o1 = false) : (if decide (o1 = true) then ∀(o2 : bv 63%N), bv_signed o2 = Z.of_nat (Ascii.nat_of_ascii c) -> int'63_in_bounds (bv_signed o2 - 65%Z) else ∀(o2 : bool), (∃(q1_1 : bv 63%N), bv_signed q1_1 = Z.of_nat (Ascii.nat_of_ascii c) ∧ (if decide (97%Z ≤ bv_signed q1_1) then o2 = (if decide (bv_signed q1_1 ≤ 122%Z) then true else false) else o2 = false)) -> (if decide (o2 = true) then ∀(o3 : bv 63%N), bv_signed o3 = Z.of_nat (Ascii.nat_of_ascii c) -> int'63_in_bounds (bv_signed o3 - 97%Z) ∧ (∀(o4 : bv 63%N), bv_signed o4 = bv_signed o3 - 97%Z -> int'63_in_bounds (bv_signed o4 + 26%Z)) else ∀(o3 : bool), (∃(q1_1 : bv 63%N), bv_signed q1_1 = Z.of_nat (Ascii.nat_of_ascii c) ∧ (if decide (48%Z ≤ bv_signed q1_1) then o3 = (if decide (bv_signed q1_1 ≤ 57%Z) then true else false) else o3 = false)) -> (if decide (o3 = true) then ∀(o4 : bv 63%N), bv_signed o4 = Z.of_nat (Ascii.nat_of_ascii c) -> int'63_in_bounds (bv_signed o4 - 48%Z) ∧ (∀(o5 : bv 63%N), bv_signed o5 = bv_signed o4 - 48%Z -> int'63_in_bounds (bv_signed o5 + 52%Z)) else ∀(o4 : bv 63%N), bv_signed o4 = Z.of_nat (Ascii.nat_of_ascii c) -> (bv_signed o4 = 43%Z -> o4 = (43%bv : bv 63%N)) -> ¬ o4 = (43%bv : bv 63%N) -> (∀(o5 : bv 63%N), bv_signed o5 = Z.of_nat (Ascii.nat_of_ascii c) -> (bv_signed o5 = 47%Z -> o5 = (47%bv : bv 63%N)) -> ¬ o5 = (47%bv : bv 63%N) -> c = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N))))))) ∧ (∀(result : bv 63%N), (if decide (o1 = true) then ∃(o2 : bv 63%N), bv_signed o2 = Z.of_nat (Ascii.nat_of_ascii c) ∧ bv_signed result = bv_signed o2 - 65%Z else ∃(o2 : bool), (∃(q1_1 : bv 63%N), bv_signed q1_1 = Z.of_nat (Ascii.nat_of_ascii c) ∧ (if decide (97%Z ≤ bv_signed q1_1) then o2 = (if decide (bv_signed q1_1 ≤ 122%Z) then true else false) else o2 = false)) ∧ (if decide (o2 = true) then ∃(o3 : bv 63%N), bv_signed o3 = Z.of_nat (Ascii.nat_of_ascii c) ∧ (∃(o4 : bv 63%N), bv_signed o4 = bv_signed o3 - 97%Z ∧ bv_signed result = bv_signed o4 + 26%Z) else ∃(o3 : bool), (∃(q1_1 : bv 63%N), bv_signed q1_1 = Z.of_nat (Ascii.nat_of_ascii c) ∧ (if decide (48%Z ≤ bv_signed q1_1) then o3 = (if decide (bv_signed q1_1 ≤ 57%Z) then true else false) else o3 = false)) ∧ (if decide (o3 = true) then ∃(o4 : bv 63%N), bv_signed o4 = Z.of_nat (Ascii.nat_of_ascii c) ∧ (∃(o5 : bv 63%N), bv_signed o5 = bv_signed o4 - 48%Z ∧ bv_signed result = bv_signed o5 + 52%Z) else ∃(o4 : bv 63%N), bv_signed o4 = Z.of_nat (Ascii.nat_of_ascii c) ∧ (bv_signed o4 = 43%Z -> o4 = (43%bv : bv 63%N)) ∧ (if decide (o4 = (43%bv : bv 63%N)) then result = (62%bv : bv 63%N) else ∃(o5 : bv 63%N), bv_signed o5 = Z.of_nat (Ascii.nat_of_ascii c) ∧ (bv_signed o5 = 47%Z -> o5 = (47%bv : bv 63%N)) ∧ (if decide (o5 = (47%bv : bv 63%N)) then result = (63%bv : bv 63%N) else c = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N))) ∧ result = (0%bv : bv 63%N)))))) -> bv_signed result = b642int c).
Admitted.
