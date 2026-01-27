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
Theorem binary_search'vc (a : list Z) (v : Z) (fact0 : ∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 ≤ i2 ∧ i2 < Z.of_nat (length a) -> nth (Z.to_nat i1) a inhabitant ≤ nth (Z.to_nat i2) a inhabitant) : (let o1 : Z := Z.of_nat (length a) - 1%Z in ((0%Z ≤ 0%Z ∧ o1 < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> 0%Z ≤ i ∧ i ≤ o1)) ∧ (∀(l : Z) (u : Z), (0%Z ≤ l ∧ u < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> l ≤ i ∧ i ≤ u) -> l ≤ u -> (l ≤ u ∧ (∀(m : Z), l ≤ m ∧ m ≤ u -> (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (¬ nth (Z.to_nat m) a inhabitant < v -> 0%Z ≤ m ∧ m < Z.of_nat (length a)))) ∧ (∀(l1 : Z) (u1 : Z), (∃(m : Z), (l ≤ m ∧ m ≤ u) ∧ (if decide (nth (Z.to_nat m) a inhabitant < v) then l1 = m + 1%Z ∧ u1 = u else (v < nth (Z.to_nat m) a inhabitant ∧ u1 = m - 1%Z) ∧ l1 = l)) -> (0%Z ≤ u - l ∧ u1 - l1 < u - l) ∧ (0%Z ≤ l1 ∧ u1 < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> l1 ≤ i ∧ i ≤ u1)))) ∧ ((∃(l : Z) (u : Z), ((0%Z ≤ l ∧ u < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> l ≤ i ∧ i ≤ u)) ∧ ¬ l ≤ u) -> (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = v)) ∧ (∀(r : Z), (∃(l : Z) (u : Z), ((0%Z ≤ l ∧ u < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> l ≤ i ∧ i ≤ u)) ∧ l ≤ u ∧ (l ≤ r ∧ r ≤ u) ∧ ¬ nth (Z.to_nat r) a inhabitant < v ∧ ¬ v < nth (Z.to_nat r) a inhabitant) -> (0%Z ≤ r ∧ r < Z.of_nat (length a)) ∧ nth (Z.to_nat r) a inhabitant = v).
Admitted.
