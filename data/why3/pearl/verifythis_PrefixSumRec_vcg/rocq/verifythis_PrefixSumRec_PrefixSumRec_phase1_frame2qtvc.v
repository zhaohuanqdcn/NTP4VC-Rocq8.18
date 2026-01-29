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
Theorem phase1_frame2'vc (left1 : Z) (right1 : Z) (a0 : list Z) (a0' : list Z) (a : list Z) (fact0 : ∀(i : Z), left1 - (right1 - left1) < i ∧ i < right1 -> nth (Z.to_nat i) a0 inhabitant = nth (Z.to_nat i) a0' inhabitant) (fact1 : phase1 left1 right1 a0 a) : phase1 left1 right1 a0' a.
Proof.
Admitted.
