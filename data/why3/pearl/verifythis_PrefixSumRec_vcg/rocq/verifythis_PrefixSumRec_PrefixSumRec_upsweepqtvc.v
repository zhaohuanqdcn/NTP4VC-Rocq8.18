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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Definition is_power_of_2 (x : Z) := ∃(k : Z), 0%Z ≤ k ∧ x = Z.pow 2%Z k.
Definition go_left (left1 : Z) (right1 : Z) : Z := let space : Z := right1 - left1 in left1 - Z.rem space 2%Z.
Definition go_right (left1 : Z) (right1 : Z) : Z := let space : Z := right1 - left1 in right1 - Z.rem space 2%Z.
Inductive phase1 : Z -> Z -> list Z -> list Z -> Prop :=
 | Leaf (right1 : Z) (left1 : Z) (a : list Z) (a0 : list Z) : right1 = left1 + 1%Z -> nth (Z.to_nat left1) a inhabitant = nth (Z.to_nat left1) a0 inhabitant -> phase1 left1 right1 a0 a
 | Node (left1 : Z) (right1 : Z) (a0 : list Z) (a : list Z) : left1 + 1%Z < right1 -> phase1 (go_left left1 right1) left1 a0 a -> phase1 (go_right left1 right1) right1 a0 a -> nth (Z.to_nat left1) a inhabitant = list_sum (drop (Z.to_nat (left1 - (right1 - left1) + 1%Z)) (take (Z.to_nat (left1 + 1%Z) - Z.to_nat (left1 - (right1 - left1) + 1%Z)) a0)) -> phase1 left1 right1 a0 a.
Theorem upsweep'vc (left1 : Z) (right1 : Z) (a : list Z) (fact0 : 0%Z ≤ left1) (fact1 : left1 < right1) (fact2 : right1 < Z.of_nat (length a)) (fact3 : - 1%Z ≤ left1 - (right1 - left1)) (fact4 : is_power_of_2 (right1 - left1)) : let space : Z := right1 - left1 in if decide (left1 + 1%Z < right1) then ¬ 2%Z = 0%Z ∧ (let o1 : Z := left1 - Z.rem space 2%Z in ((0%Z ≤ right1 - left1 ∧ left1 - o1 < right1 - left1) ∧ (0%Z ≤ o1 ∧ o1 < left1 ∧ left1 < Z.of_nat (length a)) ∧ - 1%Z ≤ o1 - (left1 - o1) ∧ is_power_of_2 (left1 - o1)) ∧ (∀(a1 : list Z), length a1 = length a -> phase1 o1 left1 a a1 ∧ (let space1 : Z := left1 - o1 in nth (Z.to_nat left1) a1 inhabitant = list_sum (drop (Z.to_nat (o1 - space1 + 1%Z)) (take (Z.to_nat (left1 + 1%Z) - Z.to_nat (o1 - space1 + 1%Z)) a)) ∧ (∀(i : Z), i ≤ o1 - space1 -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), left1 < i -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) a inhabitant)) -> ¬ 2%Z = 0%Z ∧ (let o2 : Z := right1 - Z.rem space 2%Z in ((0%Z ≤ right1 - left1 ∧ right1 - o2 < right1 - left1) ∧ (0%Z ≤ o2 ∧ o2 < right1 ∧ right1 < Z.of_nat (length a1)) ∧ - 1%Z ≤ o2 - (right1 - o2) ∧ is_power_of_2 (right1 - o2)) ∧ (∀(a2 : list Z), length a2 = length a1 -> phase1 o2 right1 a1 a2 ∧ (let space1 : Z := right1 - o2 in nth (Z.to_nat right1) a2 inhabitant = list_sum (drop (Z.to_nat (o2 - space1 + 1%Z)) (take (Z.to_nat (right1 + 1%Z) - Z.to_nat (o2 - space1 + 1%Z)) a1)) ∧ (∀(i : Z), i ≤ o2 - space1 -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) a1 inhabitant) ∧ (∀(i : Z), right1 < i -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) a1 inhabitant)) -> (0%Z ≤ right1 ∧ right1 < Z.of_nat (length a2)) ∧ (0%Z ≤ left1 ∧ left1 < Z.of_nat (length a2)) ∧ (let o3 : Z := nth (Z.to_nat left1) a2 inhabitant + nth (Z.to_nat right1) a2 inhabitant in (0%Z ≤ right1 ∧ right1 < Z.of_nat (length a2)) ∧ (length (set_list a2 (Z.to_nat right1) o3) = length a2 -> nth_i (set_list a2 (Z.to_nat right1) o3) = fun_updt (nth_i a2) right1 o3 -> phase1 left1 right1 a (set_list a2 (Z.to_nat right1) o3) ∧ (let space1 : Z := right1 - left1 in nth (Z.to_nat right1) (set_list a2 (Z.to_nat right1) o3) inhabitant = list_sum (drop (Z.to_nat (left1 - space1 + 1%Z)) (take (Z.to_nat (right1 + 1%Z) - Z.to_nat (left1 - space1 + 1%Z)) a)) ∧ (∀(i : Z), i ≤ left1 - space1 -> nth (Z.to_nat i) (set_list a2 (Z.to_nat right1) o3) inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), right1 < i -> nth (Z.to_nat i) (set_list a2 (Z.to_nat right1) o3) inhabitant = nth (Z.to_nat i) a inhabitant)))))))) else (0%Z ≤ right1 ∧ right1 < Z.of_nat (length a)) ∧ (0%Z ≤ left1 ∧ left1 < Z.of_nat (length a)) ∧ (let o1 : Z := nth (Z.to_nat left1) a inhabitant + nth (Z.to_nat right1) a inhabitant in (0%Z ≤ right1 ∧ right1 < Z.of_nat (length a)) ∧ (length (set_list a (Z.to_nat right1) o1) = length a -> nth_i (set_list a (Z.to_nat right1) o1) = fun_updt (nth_i a) right1 o1 -> phase1 left1 right1 a (set_list a (Z.to_nat right1) o1) ∧ (let space1 : Z := right1 - left1 in nth (Z.to_nat right1) (set_list a (Z.to_nat right1) o1) inhabitant = list_sum (drop (Z.to_nat (left1 - space1 + 1%Z)) (take (Z.to_nat (right1 + 1%Z) - Z.to_nat (left1 - space1 + 1%Z)) a)) ∧ (∀(i : Z), i ≤ left1 - space1 -> nth (Z.to_nat i) (set_list a (Z.to_nat right1) o1) inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), right1 < i -> nth (Z.to_nat i) (set_list a (Z.to_nat right1) o1) inhabitant = nth (Z.to_nat i) a inhabitant)))).
Admitted.
