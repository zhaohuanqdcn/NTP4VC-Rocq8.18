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
Theorem binary_search'vc (a : list Z) (fact0 : 0%Z < Z.of_nat (length a)) (fact1 : ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i ≤ j ∧ j < Z.of_nat (length a) -> 0%Z ≤ nth (Z.to_nat i) a inhabitant ∧ nth (Z.to_nat i) a inhabitant ≤ nth (Z.to_nat j) a inhabitant ∧ nth (Z.to_nat j) a inhabitant ≤ 1%Z) (fact2 : nth (Z.to_nat (Z.of_nat (length a) - 1%Z)) a inhabitant = 1%Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in ((0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ o1 < Z.of_nat (length a)) ∧ nth (Z.to_nat o1) a inhabitant = 1%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) a inhabitant = 0%Z)) ∧ (∀(lo : Z) (hi : Z), (0%Z ≤ lo ∧ lo ≤ hi ∧ hi < Z.of_nat (length a)) ∧ nth (Z.to_nat hi) a inhabitant = 1%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < lo -> nth (Z.to_nat i) a inhabitant = 0%Z) -> (if decide (lo < hi) then (¬ 2%Z = 0%Z ∧ (let mid : Z := lo + Z.rem (hi - lo) 2%Z in 0%Z ≤ mid ∧ mid < Z.of_nat (length a))) ∧ (∀(lo1 : Z) (hi1 : Z), (let mid : Z := lo + Z.rem (hi - lo) 2%Z in if decide (nth (Z.to_nat mid) a inhabitant = 1%Z) then hi1 = mid ∧ lo1 = lo else lo1 = mid + 1%Z ∧ hi1 = hi) -> (0%Z ≤ hi - lo ∧ hi1 - lo1 < hi - lo) ∧ (0%Z ≤ lo1 ∧ lo1 ≤ hi1 ∧ hi1 < Z.of_nat (length a)) ∧ nth (Z.to_nat hi1) a inhabitant = 1%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < lo1 -> nth (Z.to_nat i) a inhabitant = 0%Z)) else (0%Z ≤ lo ∧ lo < Z.of_nat (length a)) ∧ nth (Z.to_nat lo) a inhabitant = 1%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < lo -> nth (Z.to_nat i) a inhabitant = 0%Z))).
Admitted.
