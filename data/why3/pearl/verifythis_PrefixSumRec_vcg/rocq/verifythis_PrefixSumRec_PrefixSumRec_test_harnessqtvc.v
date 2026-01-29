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
Theorem test_harness'vc : 0%Z ≤ 8%Z ∧ (∀(a : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 8%Z -> nth (Z.to_nat i) a inhabitant = 0%Z) ∧ Z.of_nat (length a) = 8%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (length (set_list a 0%nat 3%Z) = length a -> nth_i (set_list a 0%nat 3%Z) = fun_updt (nth_i a) 0%Z 3%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (set_list a 0%nat 3%Z))) ∧ (length (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) = length (set_list a 0%nat 3%Z) -> nth_i (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) = fun_updt (nth_i (set_list a 0%nat 3%Z)) 1%Z 1%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z))) ∧ (length (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) = length (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) -> nth_i (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) = fun_updt (nth_i (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z)) 2%Z 7%Z -> (0%Z ≤ 3%Z ∧ 3%Z < Z.of_nat (length (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z))) ∧ (length (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) = length (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) -> nth_i (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) = fun_updt (nth_i (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z)) 3%Z 0%Z -> (0%Z ≤ 4%Z ∧ 4%Z < Z.of_nat (length (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z))) ∧ (length (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) = length (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) -> nth_i (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) = fun_updt (nth_i (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z)) 4%Z 4%Z -> (0%Z ≤ 5%Z ∧ 5%Z < Z.of_nat (length (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z))) ∧ (length (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) = length (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) -> nth_i (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) = fun_updt (nth_i (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z)) 5%Z 1%Z -> (0%Z ≤ 6%Z ∧ 6%Z < Z.of_nat (length (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z))) ∧ (length (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z) = length (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) -> nth_i (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z) = fun_updt (nth_i (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z)) 6%Z 6%Z -> (0%Z ≤ 7%Z ∧ 7%Z < Z.of_nat (length (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z))) ∧ (length (set_list (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z) 7%nat 3%Z) = length (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z) -> nth_i (set_list (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z) 7%nat 3%Z) = fun_updt (nth_i (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z)) 7%Z 3%Z -> 2%Z ≤ Z.of_nat (length (set_list (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z) 7%nat 3%Z)) ∧ is_power_of_2 (Z.of_nat (length (set_list (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 1%Z) 2%nat 7%Z) 3%nat 0%Z) 4%nat 4%Z) 5%nat 1%Z) 6%nat 6%Z) 7%nat 3%Z)))))))))))).
Proof.
Admitted.
