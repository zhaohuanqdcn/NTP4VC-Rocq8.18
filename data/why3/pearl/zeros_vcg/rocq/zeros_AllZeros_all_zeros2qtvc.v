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
Definition all_zeros (a : list Z) (hi : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < hi -> nth (Z.to_nat i) a inhabitant = 0%Z.
Theorem all_zeros2'vc (a : list Z) : 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a) ∧ all_zeros a 0%Z ∧ (∀(i : Z) (res : bool), (0%Z ≤ i ∧ i ≤ Z.of_nat (length a)) ∧ (res = true) = all_zeros a i -> (∀(o1 : bool), (if decide (res = true) then o1 = (if decide (i < Z.of_nat (length a)) then true else false) else o1 = false) -> (if decide (o1 = true) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ Z.of_nat (length a) - i ∧ Z.of_nat (length a) - (i + 1%Z) < Z.of_nat (length a) - i) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ Z.of_nat (length a)) ∧ ((if decide (nth (Z.to_nat i) a inhabitant = 0%Z) then true else false) = true) = all_zeros a (i + 1%Z) else (res = true) = all_zeros a (Z.of_nat (length a))))).
Admitted.
