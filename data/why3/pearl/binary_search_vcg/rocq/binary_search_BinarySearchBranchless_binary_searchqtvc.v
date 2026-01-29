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
Theorem binary_search'vc (a : list Z) (v : Z) (fact0 : ∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 ≤ i2 ∧ i2 < Z.of_nat (length a) -> nth (Z.to_nat i1) a inhabitant ≤ nth (Z.to_nat i2) a inhabitant) : let o1 : Z := Z.of_nat (length a) in if decide (o1 = 0%Z) then ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = v else ((0%Z ≤ 0%Z ∧ 0%Z + o1 ≤ Z.of_nat (length a) ∧ 1%Z ≤ o1) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> nth 0%nat a inhabitant ≤ v ∧ i < 0%Z + o1)) ∧ (∀(s : Z) (l : Z), (0%Z ≤ l ∧ l + s ≤ Z.of_nat (length a) ∧ 1%Z ≤ s) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> nth (Z.to_nat l) a inhabitant ≤ v ∧ i < l + s) -> (if decide (1%Z < s) then ¬ 2%Z = 0%Z ∧ (let h : Z := Z.rem s 2%Z in let m : Z := l + h in (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (∀(o2 : Z), (if decide (v < nth (Z.to_nat m) a inhabitant) then o2 = l else o2 = m) -> (0%Z ≤ s ∧ s - h < s) ∧ (0%Z ≤ o2 ∧ o2 + (s - h) ≤ Z.of_nat (length a) ∧ 1%Z ≤ s - h) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant = v -> nth (Z.to_nat o2) a inhabitant ≤ v ∧ i < o2 + (s - h)))) else (0%Z ≤ l ∧ l < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat l) a inhabitant = v) then ((0%Z ≤ l ∧ l < Z.of_nat (length a)) ∧ nth (Z.to_nat l) a inhabitant = v) ∧ (∀(i : Z), l < i ∧ i < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = v) else ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = v))).
Proof.
Admitted.
