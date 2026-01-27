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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Theorem binary_mult'vc (a : bv 63%N) (b : bv 63%N) (fact0 : bv_signed int'63_min < bv_signed a * bv_signed b) (fact1 : bv_signed a * bv_signed b ≤ bv_signed int'63_max) : (if decide (0%Z ≤ bv_signed a * bv_signed b) then 0%Z ≤ bv_signed a * bv_signed b ∧ 0%Z ≤ 0%Z else bv_signed a * bv_signed b ≤ 0%Z ∧ 0%Z ≤ 0%Z) ∧ 0%Z + bv_signed a * bv_signed b = bv_signed a * bv_signed b ∧ (∀(z : bv 63%N) (y : bv 63%N) (x : bv 63%N), (if decide (0%Z ≤ bv_signed a * bv_signed b) then 0%Z ≤ bv_signed x * bv_signed y ∧ 0%Z ≤ bv_signed z else bv_signed x * bv_signed y ≤ 0%Z ∧ bv_signed z ≤ 0%Z) ∧ bv_signed z + bv_signed x * bv_signed y = bv_signed a * bv_signed b -> (bv_signed y = 0%Z -> y = (0%bv : bv 63%N)) -> (if decide (¬ y = (0%bv : bv 63%N)) then (¬ 2%Z = 0%Z ∧ int'63_in_bounds (Z.quot (bv_signed y) 2%Z)) ∧ (∀(o1 : bv 63%N), bv_signed o1 = Z.quot (bv_signed y) 2%Z -> int'63_in_bounds (bv_signed x * bv_signed o1) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed x * bv_signed o1 -> int'63_in_bounds (bv_signed z + bv_signed o2) ∧ (∀(o3 : bv 63%N), bv_signed o3 = bv_signed z + bv_signed o2 -> (¬ 2%Z = 0%Z ∧ int'63_in_bounds (Z.rem (bv_signed y) 2%Z)) ∧ (∀(o4 : bv 63%N), bv_signed o4 = Z.rem (bv_signed y) 2%Z -> (bv_signed o4 = 0%Z -> o4 = (0%bv : bv 63%N)) -> (if decide (¬ o4 = (0%bv : bv 63%N)) then int'63_in_bounds (2%Z * bv_signed x) ∧ (∀(o5 : bv 63%N), bv_signed o5 = 2%Z * bv_signed x -> (0%Z ≤ Z.abs (bv_signed y) ∧ Z.abs (bv_signed o4) < Z.abs (bv_signed y)) ∧ (if decide (0%Z ≤ bv_signed a * bv_signed b) then 0%Z ≤ bv_signed o5 * bv_signed o4 ∧ 0%Z ≤ bv_signed o3 else bv_signed o5 * bv_signed o4 ≤ 0%Z ∧ bv_signed o3 ≤ 0%Z) ∧ bv_signed o3 + bv_signed o5 * bv_signed o4 = bv_signed a * bv_signed b) else (0%Z ≤ Z.abs (bv_signed y) ∧ Z.abs (bv_signed o4) < Z.abs (bv_signed y)) ∧ (if decide (0%Z ≤ bv_signed a * bv_signed b) then 0%Z ≤ bv_signed x * bv_signed o4 ∧ 0%Z ≤ bv_signed o3 else bv_signed x * bv_signed o4 ≤ 0%Z ∧ bv_signed o3 ≤ 0%Z) ∧ bv_signed o3 + bv_signed x * bv_signed o4 = bv_signed a * bv_signed b))))) else bv_signed z = bv_signed a * bv_signed b)).
Admitted.
