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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Definition is_power_of_2 (x : Z) := ∃(k : Z), 0%Z ≤ k ∧ x = Z.pow 2%Z k.
Definition go_left (left1 : Z) (right1 : Z) : Z := let space : Z := right1 - left1 in left1 - Z.rem space 2%Z.
Definition go_right (left1 : Z) (right1 : Z) : Z := let space : Z := right1 - left1 in right1 - Z.rem space 2%Z.
Inductive phase1 : Z -> Z -> list Z -> list Z -> Prop :=
 | Leaf (right1 : Z) (left1 : Z) (a : list Z) (a0 : list Z) : right1 = left1 + 1%Z -> nth (Z.to_nat left1) a inhabitant = nth (Z.to_nat left1) a0 inhabitant -> phase1 left1 right1 a0 a
 | Node (left1 : Z) (right1 : Z) (a0 : list Z) (a : list Z) : left1 + 1%Z < right1 -> phase1 (go_left left1 right1) left1 a0 a -> phase1 (go_right left1 right1) right1 a0 a -> nth (Z.to_nat left1) a inhabitant = list_sum (drop (Z.to_nat (left1 - (right1 - left1) + 1%Z)) (take (Z.to_nat (left1 + 1%Z) - Z.to_nat (left1 - (right1 - left1) + 1%Z)) a0)) -> phase1 left1 right1 a0 a.
Definition partial_sum (left1 : Z) (right1 : Z) (a0 : list Z) (a : list Z) := ∀(i : Z), left1 - (right1 - left1) < i ∧ i ≤ right1 -> nth (Z.to_nat i) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat i - 0%nat) a0)).
Theorem compute_sums'vc (a : list Z) (a0 : list Z) (fact0 : 2%Z ≤ Z.of_nat (length a)) (fact1 : is_power_of_2 (Z.of_nat (length a))) (fact2 : length a0 = length a) (fact3 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a0) -> nth (Z.to_nat i) a0 inhabitant = nth (Z.to_nat i) a inhabitant) : let l : Z := Z.of_nat (length a) in ¬ 2%Z = 0%Z ∧ (let left1 : Z := Z.rem l 2%Z - 1%Z in let right1 : Z := l - 1%Z in ((0%Z ≤ left1 ∧ left1 < right1 ∧ right1 < Z.of_nat (length a)) ∧ - 1%Z ≤ left1 - (right1 - left1) ∧ is_power_of_2 (right1 - left1)) ∧ (∀(a1 : list Z), length a1 = length a -> phase1 left1 right1 a a1 ∧ (let space : Z := right1 - left1 in nth (Z.to_nat right1) a1 inhabitant = list_sum (drop (Z.to_nat (left1 - space + 1%Z)) (take (Z.to_nat (right1 + 1%Z) - Z.to_nat (left1 - space + 1%Z)) a)) ∧ (∀(i : Z), i ≤ left1 - space -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), right1 < i -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) a inhabitant)) -> (0%Z ≤ right1 ∧ right1 < Z.of_nat (length a1)) ∧ (length (set_list a1 (Z.to_nat right1) 0%Z) = length a1 -> nth_i (set_list a1 (Z.to_nat right1) 0%Z) = fun_updt (nth_i a1) right1 0%Z -> ((0%Z ≤ left1 ∧ left1 < right1 ∧ right1 < Z.of_nat (length (set_list a1 (Z.to_nat right1) 0%Z))) ∧ - 1%Z ≤ left1 - (right1 - left1) ∧ is_power_of_2 (right1 - left1) ∧ nth (Z.to_nat right1) (set_list a1 (Z.to_nat right1) 0%Z) inhabitant = list_sum (drop 0%nat (take (Z.to_nat (left1 - (right1 - left1) + 1%Z) - 0%nat) a0)) ∧ phase1 left1 right1 a0 (set_list a1 (Z.to_nat right1) 0%Z)) ∧ (∀(a2 : list Z), length a2 = length (set_list a1 (Z.to_nat right1) 0%Z) -> partial_sum left1 right1 a0 a2 ∧ (∀(i : Z), i ≤ left1 - (right1 - left1) -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) (set_list a1 (Z.to_nat right1) 0%Z) inhabitant) ∧ (∀(i : Z), right1 < i -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) (set_list a1 (Z.to_nat right1) 0%Z) inhabitant) -> (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a2) -> nth (Z.to_nat i) a2 inhabitant = list_sum (drop 0%nat (take (Z.to_nat i - 0%nat) a))))))).
Proof.
Admitted.
