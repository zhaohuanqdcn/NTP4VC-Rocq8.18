From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Theorem binary_search'vc (a : list Z) (v : Z) (fact0 : ∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 ≤ i2 ∧ i2 < Z.of_nat (length a) -> nth (Z.to_nat i1) a inhabitant ≤ nth (Z.to_nat i2) a inhabitant) : let o1 : Z := Z.of_nat (length a) - 1%Z in ((0%Z ≤ 0%Z ∧ o1 < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> 0%Z ≤ i ∧ i ≤ o1)) ∧ (∀(u : Z) (l : Z), (0%Z ≤ l ∧ u < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> l ≤ i ∧ i ≤ u) -> (if decide (l ≤ u) then ¬ 2%Z = 0%Z ∧ (let m : Z := l + Z.rem (u - l) 2%Z in (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat m) a inhabitant < v) then (0%Z ≤ u - l ∧ u - (m + 1%Z) < u - l) ∧ (0%Z ≤ m + 1%Z ∧ u < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> m + 1%Z ≤ i ∧ i ≤ u) else (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (if decide (v < nth (Z.to_nat m) a inhabitant) then (0%Z ≤ u - l ∧ m - 1%Z - l < u - l) ∧ (0%Z ≤ l ∧ m - 1%Z < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> l ≤ i ∧ i ≤ m - 1%Z) else (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ nth (Z.to_nat m) a inhabitant = v))) else ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = v)).
Proof.
Admitted.
