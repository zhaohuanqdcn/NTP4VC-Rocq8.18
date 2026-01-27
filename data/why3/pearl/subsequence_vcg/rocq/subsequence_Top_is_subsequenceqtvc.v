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
Open Scope Z_scope.
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Definition subsequence (v : list char) (u : list char) (f : Z -> Z) := (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length v) -> (0%Z ≤ f i ∧ f i < Z.of_nat (length u)) ∧ nth (Z.to_nat i) v inhabitant = nth (Z.to_nat (f i)) u inhabitant) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length v) -> f i < f j).
Axiom identity : Z -> Z.
Axiom identity_def : forall  (y : Z), identity y = y.
Theorem is_subsequence'vc (v : list char) (u : list char) : (∀(i : Z) (j : Z) (f : Z -> Z), (0%Z ≤ i ∧ i ≤ Z.of_nat (length v)) ∧ (0%Z ≤ j ∧ j ≤ Z.of_nat (length u)) ∧ subsequence (drop 0%nat (take (Z.to_nat i - 0%nat) v)) (drop 0%nat (take (Z.to_nat j - 0%nat) u)) f ∧ (∀(f1 : Z -> Z), subsequence v u f1 -> i < Z.of_nat (length v) -> j ≤ f1 i) -> (let o1 : Z := Z.of_nat (length v) in (¬ i = o1 -> j < Z.of_nat (length u) -> (if decide (nth (Z.to_nat i) v inhabitant = nth (Z.to_nat j) u inhabitant) then let o2 : Z := j + 1%Z in let o3 : Z := i + 1%Z in (0%Z ≤ Z.of_nat (length u) - j ∧ Z.of_nat (length u) - o2 < Z.of_nat (length u) - j) ∧ (0%Z ≤ o3 ∧ o3 ≤ Z.of_nat (length v)) ∧ (0%Z ≤ o2 ∧ o2 ≤ Z.of_nat (length u)) ∧ subsequence (drop 0%nat (take (Z.to_nat o3 - 0%nat) v)) (drop 0%nat (take (Z.to_nat o2 - 0%nat) u)) (fun_updt f i j) ∧ (∀(f1 : Z -> Z), subsequence v u f1 -> o3 < Z.of_nat (length v) -> o2 ≤ f1 o3) else let o2 : Z := j + 1%Z in (0%Z ≤ Z.of_nat (length u) - j ∧ Z.of_nat (length u) - o2 < Z.of_nat (length u) - j) ∧ (0%Z ≤ i ∧ i ≤ Z.of_nat (length v)) ∧ (0%Z ≤ o2 ∧ o2 ≤ Z.of_nat (length u)) ∧ subsequence (drop 0%nat (take (Z.to_nat i - 0%nat) v)) (drop 0%nat (take (Z.to_nat o2 - 0%nat) u)) f ∧ (∀(f1 : Z -> Z), subsequence v u f1 -> i < Z.of_nat (length v) -> o2 ≤ f1 i))) ∧ (∀(result : bool), (if decide (i = o1) then result = true else if decide (j < Z.of_nat (length u)) then result = (if decide (∃(f1 : Z -> Z), subsequence v u f1) then true else false) else result = false) -> (result = true) = (∃(f1 : Z -> Z), subsequence v u f1)))) ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length v) ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length u) ∧ subsequence (drop 0%nat (take (0%nat - 0%nat) v)) (drop 0%nat (take (0%nat - 0%nat) u)) identity ∧ (∀(f : Z -> Z), subsequence v u f -> 0%Z < Z.of_nat (length v) -> 0%Z ≤ f 0%Z).
Admitted.
