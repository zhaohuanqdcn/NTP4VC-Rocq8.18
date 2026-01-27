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
Definition zero_interval (a : list Z) (lo : Z) (hi : Z) := ∀(i : Z), lo ≤ i ∧ i < hi -> nth (Z.to_nat i) a inhabitant = 0%Z.
Theorem all_zeros5'vc (a : list Z) : (∀(lo : Z) (hi : Z), 0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ Z.of_nat (length a) -> (¬ hi ≤ lo -> ¬ 2%Z = 0%Z ∧ (let mid : Z := lo + Z.rem (hi - lo) 2%Z in (0%Z ≤ mid ∧ mid < Z.of_nat (length a)) ∧ (nth (Z.to_nat mid) a inhabitant = 0%Z -> ((0%Z ≤ hi - lo ∧ mid - lo < hi - lo) ∧ 0%Z ≤ lo ∧ lo ≤ mid ∧ mid ≤ Z.of_nat (length a)) ∧ (zero_interval a lo mid -> (let o1 : Z := mid + 1%Z in (0%Z ≤ hi - lo ∧ hi - o1 < hi - lo) ∧ 0%Z ≤ o1 ∧ o1 ≤ hi ∧ hi ≤ Z.of_nat (length a)))))) ∧ (∀(result : bool), (if decide (hi ≤ lo) then result = true else let mid : Z := lo + Z.rem (hi - lo) 2%Z in if decide (nth (Z.to_nat mid) a inhabitant = 0%Z) then if decide (zero_interval a lo mid) then result = (if decide (zero_interval a (mid + 1%Z) hi) then true else false) else result = false else result = false) -> (result = true) = zero_interval a lo hi)) ∧ (let o1 : Z := Z.of_nat (length a) in (0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length a)) ∧ zero_interval a 0%Z o1 = all_zeros a (Z.of_nat (length a))).
Admitted.
