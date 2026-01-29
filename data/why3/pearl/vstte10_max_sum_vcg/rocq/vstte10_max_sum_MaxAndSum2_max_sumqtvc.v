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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Definition is_max (a : list Z) (l : Z) (h : Z) (m : Z) := (∀(k : Z), l ≤ k ∧ k < h -> nth (Z.to_nat k) a inhabitant ≤ m) ∧ (h ≤ l ∧ m = 0%Z ∨ l < h ∧ (∃(k : Z), (l ≤ k ∧ k < h) ∧ m = nth (Z.to_nat k) a inhabitant)).
Theorem max_sum'vc (a : list Z) (fact0 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 0%Z ≤ nth (Z.to_nat i) a inhabitant) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> (0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a)) ∧ is_max a 0%Z 0%Z 0%Z ∧ 0%Z ≤ 0%Z * 0%Z) ∧ (∀(m : Z) (s : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ s = list_sum (drop 0%nat (take (Z.to_nat i - 0%nat) a)) ∧ is_max a 0%Z i m ∧ s ≤ i * m -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (m < nth (Z.to_nat i) a inhabitant) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ s + nth (Z.to_nat i) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) ∧ is_max a 0%Z (i + 1%Z) (nth (Z.to_nat i) a inhabitant) ∧ s + nth (Z.to_nat i) a inhabitant ≤ (i + 1%Z) * nth (Z.to_nat i) a inhabitant else (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ s + nth (Z.to_nat i) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) ∧ is_max a 0%Z (i + 1%Z) m ∧ s + nth (Z.to_nat i) a inhabitant ≤ (i + 1%Z) * m)) ∧ (s = list_sum (drop 0%nat (take (Z.to_nat (o1 + 1%Z) - 0%nat) a)) ∧ is_max a 0%Z (o1 + 1%Z) m ∧ s ≤ (o1 + 1%Z) * m -> s = list_sum (drop 0%nat (take (length a - 0%nat) a)) ∧ is_max a 0%Z (Z.of_nat (length a)) m ∧ s ≤ Z.of_nat (length a) * m))) ∧ (o1 + 1%Z < 0%Z -> 0%Z = list_sum (drop 0%nat (take (length a - 0%nat) a)) ∧ is_max a 0%Z (Z.of_nat (length a)) 0%Z ∧ 0%Z ≤ Z.of_nat (length a) * 0%Z).
Proof.
Admitted.
