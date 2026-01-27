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
Theorem int2b64'vc (i : bv 63%N) (o1 : bool) (fact0 : 0%Z ≤ bv_signed i) (fact1 : bv_signed i < 64%Z) (fact2 : if decide (0%Z ≤ bv_signed i) then o1 = (if decide (bv_signed i ≤ 25%Z) then true else false) else o1 = false) : (if decide (o1 = true) then int'63_in_bounds (bv_signed i + 65%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed i + 65%Z -> 0%Z ≤ bv_signed o2 ∧ bv_signed o2 < 256%Z) else ∀(o2 : bool), (if decide (26%Z ≤ bv_signed i) then o2 = (if decide (bv_signed i ≤ 51%Z) then true else false) else o2 = false) -> (if decide (o2 = true) then int'63_in_bounds (bv_signed i - 26%Z) ∧ (∀(o3 : bv 63%N), bv_signed o3 = bv_signed i - 26%Z -> int'63_in_bounds (bv_signed o3 + 97%Z) ∧ (∀(o4 : bv 63%N), bv_signed o4 = bv_signed o3 + 97%Z -> 0%Z ≤ bv_signed o4 ∧ bv_signed o4 < 256%Z)) else ∀(o3 : bool), (if decide (52%Z ≤ bv_signed i) then o3 = (if decide (bv_signed i ≤ 61%Z) then true else false) else o3 = false) -> (if decide (o3 = true) then int'63_in_bounds (bv_signed i - 52%Z) ∧ (∀(o4 : bv 63%N), bv_signed o4 = bv_signed i - 52%Z -> int'63_in_bounds (bv_signed o4 + 48%Z) ∧ (∀(o5 : bv 63%N), bv_signed o5 = bv_signed o4 + 48%Z -> 0%Z ≤ bv_signed o5 ∧ bv_signed o5 < 256%Z)) else (bv_signed i = 62%Z -> i = (62%bv : bv 63%N)) -> (if decide (i = (62%bv : bv 63%N)) then 0%Z ≤ 43%Z ∧ 43%Z < 256%Z else (bv_signed i = 63%Z -> i = (63%bv : bv 63%N)) -> i = (63%bv : bv 63%N) ∧ 0%Z ≤ 47%Z ∧ 47%Z < 256%Z)))) ∧ (∀(result : ascii), (if decide (o1 = true) then ∃(o2 : bv 63%N), bv_signed o2 = bv_signed i + 65%Z ∧ result = Ascii.ascii_of_nat (Z.to_nat (bv_signed o2)) else ∃(o2 : bool), (if decide (26%Z ≤ bv_signed i) then o2 = (if decide (bv_signed i ≤ 51%Z) then true else false) else o2 = false) ∧ (if decide (o2 = true) then ∃(o3 : bv 63%N), bv_signed o3 = bv_signed i - 26%Z ∧ (∃(o4 : bv 63%N), bv_signed o4 = bv_signed o3 + 97%Z ∧ result = Ascii.ascii_of_nat (Z.to_nat (bv_signed o4))) else ∃(o3 : bool), (if decide (52%Z ≤ bv_signed i) then o3 = (if decide (bv_signed i ≤ 61%Z) then true else false) else o3 = false) ∧ (if decide (o3 = true) then ∃(o4 : bv 63%N), bv_signed o4 = bv_signed i - 52%Z ∧ (∃(o5 : bv 63%N), bv_signed o5 = bv_signed o4 + 48%Z ∧ result = Ascii.ascii_of_nat (Z.to_nat (bv_signed o5))) else (bv_signed i = 62%Z -> i = (62%bv : bv 63%N)) ∧ (if decide (i = (62%bv : bv 63%N)) then result = Ascii.ascii_of_nat 43%nat else (bv_signed i = 63%Z -> i = (63%bv : bv 63%N)) ∧ i = (63%bv : bv 63%N) ∧ result = Ascii.ascii_of_nat 47%nat)))) -> result = int2b64 (bv_signed i)).
Admitted.
