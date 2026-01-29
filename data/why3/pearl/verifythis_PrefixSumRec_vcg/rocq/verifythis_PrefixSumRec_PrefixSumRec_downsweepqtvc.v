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
Theorem downsweep'vc (left1 : Z) (right1 : Z) (a : list Z) (a0 : list Z) (fact0 : 0%Z ≤ left1) (fact1 : left1 < right1) (fact2 : right1 < Z.of_nat (length a)) (fact3 : - 1%Z ≤ left1 - (right1 - left1)) (fact4 : is_power_of_2 (right1 - left1)) (fact5 : nth (Z.to_nat right1) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat (left1 - (right1 - left1) + 1%Z) - 0%nat) a0))) (fact6 : phase1 left1 right1 a0 a) : 0%Z ≤ right1 ∧ right1 < Z.of_nat (length a) ∧ (let tmp : Z := nth (Z.to_nat right1) a inhabitant in (0%Z ≤ left1 ∧ left1 < Z.of_nat (length a)) ∧ (0%Z ≤ right1 ∧ right1 < Z.of_nat (length a)) ∧ (let o1 : Z := nth (Z.to_nat right1) a inhabitant + nth (Z.to_nat left1) a inhabitant in (0%Z ≤ right1 ∧ right1 < Z.of_nat (length a)) ∧ (length (set_list a (Z.to_nat right1) o1) = length a -> nth_i (set_list a (Z.to_nat right1) o1) = fun_updt (nth_i a) right1 o1 -> (0%Z ≤ left1 ∧ left1 < Z.of_nat (length (set_list a (Z.to_nat right1) o1))) ∧ (length (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) = length (set_list a (Z.to_nat right1) o1) -> nth_i (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) = fun_updt (nth_i (set_list a (Z.to_nat right1) o1)) left1 tmp -> (if decide (left1 + 1%Z < right1) then let space : Z := right1 - left1 in ¬ 2%Z = 0%Z ∧ (let o2 : Z := left1 - Z.rem space 2%Z in ((0%Z ≤ right1 - left1 ∧ left1 - o2 < right1 - left1) ∧ (0%Z ≤ o2 ∧ o2 < left1 ∧ left1 < Z.of_nat (length (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp))) ∧ - 1%Z ≤ o2 - (left1 - o2) ∧ is_power_of_2 (left1 - o2) ∧ nth (Z.to_nat left1) (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) inhabitant = list_sum (drop 0%nat (take (Z.to_nat (o2 - (left1 - o2) + 1%Z) - 0%nat) a0)) ∧ phase1 o2 left1 a0 (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp)) ∧ (∀(a1 : list Z), length a1 = length (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) -> partial_sum o2 left1 a0 a1 ∧ (∀(i : Z), i ≤ o2 - (left1 - o2) -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) inhabitant) ∧ (∀(i : Z), left1 < i -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) inhabitant) -> ¬ 2%Z = 0%Z ∧ (let o3 : Z := right1 - Z.rem space 2%Z in ((0%Z ≤ right1 - left1 ∧ right1 - o3 < right1 - left1) ∧ (0%Z ≤ o3 ∧ o3 < right1 ∧ right1 < Z.of_nat (length a1)) ∧ - 1%Z ≤ o3 - (right1 - o3) ∧ is_power_of_2 (right1 - o3) ∧ nth (Z.to_nat right1) a1 inhabitant = list_sum (drop 0%nat (take (Z.to_nat (o3 - (right1 - o3) + 1%Z) - 0%nat) a0)) ∧ phase1 o3 right1 a0 a1) ∧ (∀(a2 : list Z), length a2 = length a1 -> partial_sum o3 right1 a0 a2 ∧ (∀(i : Z), i ≤ o3 - (right1 - o3) -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) a1 inhabitant) ∧ (∀(i : Z), right1 < i -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) a1 inhabitant) -> partial_sum left1 right1 a0 a2 ∧ (∀(i : Z), i ≤ left1 - (right1 - left1) -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), right1 < i -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) a inhabitant))))) else partial_sum left1 right1 a0 (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) ∧ (∀(i : Z), i ≤ left1 - (right1 - left1) -> nth (Z.to_nat i) (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), right1 < i -> nth (Z.to_nat i) (set_list (set_list a (Z.to_nat right1) o1) (Z.to_nat left1) tmp) inhabitant = nth (Z.to_nat i) a inhabitant)))))).
Proof.
Admitted.
