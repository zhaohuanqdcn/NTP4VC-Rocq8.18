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
Require Import Why3.int.Iter.
Open Scope Z_scope.
Definition spec (x : Z) : Z := if decide (x ≤ 100%Z) then 91%Z else x - 10%Z.
Theorem f91_pseudorec'vc (n0 : bv 63%N) : (∀(e : nat) (n : bv 63%N), 0%Z ≤ Z.of_nat e -> (if decide (¬ Z.of_nat 0%nat < Z.of_nat e) then Z.of_nat e = 0%Z else if decide (100%Z < bv_signed n) then int'63_in_bounds (bv_signed n - 10%Z) else int'63_in_bounds (bv_signed n + 11%Z)) ∧ (∀(e1 : nat) (n1 : bv 63%N), Z.of_nat 0%nat < Z.of_nat e ∧ (if decide (100%Z < bv_signed n) then bv_signed n1 = bv_signed n - 10%Z ∧ Z.of_nat e1 = Z.of_nat e - 1%Z else bv_signed n1 = bv_signed n + 11%Z ∧ Z.of_nat e1 = Z.of_nat e + 1%Z) -> 0%Z < Z.of_nat e ∧ (if decide (100%Z < bv_signed n) then bv_signed n1 = bv_signed n - 10%Z ∧ Z.of_nat e1 = Z.of_nat e - 1%Z else bv_signed n1 = bv_signed n + 11%Z ∧ Z.of_nat e1 = Z.of_nat e + 1%Z))) ∧ (∀(e : nat) (n : bv 63%N), 0%Z < Z.of_nat e -> (0%Z ≤ Z.of_nat e ∧ (∀(e1 : nat) (n1 : bv 63%N), (0%Z < Z.of_nat e ∧ (if decide (100%Z < bv_signed n) then bv_signed n1 = bv_signed n - 10%Z ∧ Z.of_nat e1 = Z.of_nat e - 1%Z else bv_signed n1 = bv_signed n + 11%Z ∧ Z.of_nat e1 = Z.of_nat e + 1%Z) -> bv_signed n ≤ 100%Z -> ((0%Z ≤ 101%Z - bv_signed n ∧ 101%Z - bv_signed n1 < 101%Z - bv_signed n) ∧ 0%Z < Z.of_nat e1) ∧ (∀(e2 : nat) (n2 : bv 63%N), Z.of_nat e2 = Z.of_nat e1 - 1%Z ∧ bv_signed n2 = spec (bv_signed n1) -> (0%Z ≤ 101%Z - bv_signed n ∧ 101%Z - bv_signed n2 < 101%Z - bv_signed n) ∧ 0%Z < Z.of_nat e2)) ∧ ¬ ((e1 = e ∧ Z.of_nat e = 0%Z) ∧ n1 = n))) ∧ (∀(e1 : nat) (n1 : bv 63%N), (∃(e2 : nat) (n2 : bv 63%N), (0%Z < Z.of_nat e ∧ (if decide (100%Z < bv_signed n) then bv_signed n2 = bv_signed n - 10%Z ∧ Z.of_nat e2 = Z.of_nat e - 1%Z else bv_signed n2 = bv_signed n + 11%Z ∧ Z.of_nat e2 = Z.of_nat e + 1%Z)) ∧ (if decide (bv_signed n ≤ 100%Z) then ∃(e3 : nat) (n3 : bv 63%N), (Z.of_nat e3 = Z.of_nat e2 - 1%Z ∧ bv_signed n3 = spec (bv_signed n2)) ∧ Z.of_nat e1 = Z.of_nat e3 - 1%Z ∧ bv_signed n1 = spec (bv_signed n3) else e1 = e2 ∧ n1 = n2)) -> Z.of_nat e1 = Z.of_nat e - 1%Z ∧ bv_signed n1 = spec (bv_signed n))) ∧ 0%Z < Z.of_nat 1%nat ∧ (∀(e : nat) (n : bv 63%N), Z.of_nat e = Z.of_nat 1%nat - 1%Z ∧ bv_signed n = spec (bv_signed n0) -> 0%Z ≤ Z.of_nat e ∧ (∀(e1 : nat) (n1 : bv 63%N), ¬ (0%Z < Z.of_nat e ∧ (if decide (100%Z < bv_signed n) then bv_signed n1 = bv_signed n - 10%Z ∧ Z.of_nat e1 = Z.of_nat e - 1%Z else bv_signed n1 = bv_signed n + 11%Z ∧ Z.of_nat e1 = Z.of_nat e + 1%Z)) ∧ ((e1 = e ∧ Z.of_nat e = 0%Z) ∧ n1 = n -> bv_signed n1 = spec (bv_signed n0)))).
Admitted.
