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
Theorem max'vc (a : list Z) (fact0 : 0%Z < Z.of_nat (length a)) : let o1 : Z := Z.of_nat (length a) - 1%Z in ((0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ o1 < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z ∨ o1 < i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ Z.max (nth 0%nat a inhabitant) (nth (Z.to_nat o1) a inhabitant))) ∧ (∀(y : Z) (x : Z), (0%Z ≤ x ∧ x ≤ y ∧ y < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < x ∨ y < i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ Z.max (nth (Z.to_nat x) a inhabitant) (nth (Z.to_nat y) a inhabitant)) -> (if decide (¬ x = y) then (0%Z ≤ y ∧ y < Z.of_nat (length a)) ∧ (0%Z ≤ x ∧ x < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat x) a inhabitant ≤ nth (Z.to_nat y) a inhabitant) then (0%Z ≤ y - x ∧ y - (x + 1%Z) < y - x) ∧ (0%Z ≤ x + 1%Z ∧ x + 1%Z ≤ y ∧ y < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < x + 1%Z ∨ y < i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ Z.max (nth (Z.to_nat (x + 1%Z)) a inhabitant) (nth (Z.to_nat y) a inhabitant)) else (0%Z ≤ y - x ∧ y - 1%Z - x < y - x) ∧ (0%Z ≤ x ∧ x ≤ y - 1%Z ∧ y - 1%Z < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < x ∨ y - 1%Z < i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ Z.max (nth (Z.to_nat x) a inhabitant) (nth (Z.to_nat (y - 1%Z)) a inhabitant))) else (0%Z ≤ x ∧ x < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ nth (Z.to_nat x) a inhabitant))).
Proof.
Admitted.
