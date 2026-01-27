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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.Sum.
Open Scope Z_scope.
Definition diff (a : list Z) (i : Z) : Z := Z.abs (list_sum (drop 0%nat (take (Z.to_nat i - 0%nat) a)) - list_sum (drop (Z.to_nat i) (take (length a - Z.to_nat i) a))).
Theorem fulcrum'vc (a : list Z) : let n : Z := Z.of_nat (length a) in let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> 0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a)) ∧ (∀(right1 : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ right1 = list_sum (drop 0%nat (take (Z.to_nat i - 0%nat) a)) -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ right1 + nth (Z.to_nat i) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a))) ∧ (right1 = list_sum (drop 0%nat (take (Z.to_nat (o1 + 1%Z) - 0%nat) a)) -> (let o2 : Z := Z.abs right1 in let o3 : Z := n - 1%Z in (0%Z ≤ o3 + 1%Z -> (0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a)) ∧ right1 = list_sum (drop 0%nat (take (Z.to_nat n - 0%nat) a)) ∧ 0%Z ≤ 0%Z ∧ o2 = diff a 0%Z ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ 0%Z -> o2 ≤ diff a j)) ∧ (∀(bestd : Z) (besti : Z) (left1 : Z) (right2 : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o3) ∧ left1 = list_sum (drop 0%nat (take (Z.to_nat i - 0%nat) a)) ∧ right2 = list_sum (drop (Z.to_nat i) (take (Z.to_nat n - Z.to_nat i) a)) ∧ (0%Z ≤ besti ∧ besti ≤ i) ∧ bestd = diff a besti ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ i -> bestd ≤ diff a j) -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let d : Z := Z.abs (left1 + nth (Z.to_nat i) a inhabitant - (right2 - nth (Z.to_nat i) a inhabitant)) in if decide (d < bestd) then left1 + nth (Z.to_nat i) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) ∧ right2 - nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat (i + 1%Z)) (take (Z.to_nat n - Z.to_nat (i + 1%Z)) a)) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z) ∧ d = diff a (i + 1%Z) ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ i + 1%Z -> d ≤ diff a j) else left1 + nth (Z.to_nat i) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) ∧ right2 - nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat (i + 1%Z)) (take (Z.to_nat n - Z.to_nat (i + 1%Z)) a)) ∧ (0%Z ≤ besti ∧ besti ≤ i + 1%Z) ∧ bestd = diff a besti ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ i + 1%Z -> bestd ≤ diff a j))) ∧ (left1 = list_sum (drop 0%nat (take (Z.to_nat (o3 + 1%Z) - 0%nat) a)) ∧ right2 = list_sum (drop (Z.to_nat (o3 + 1%Z)) (take (Z.to_nat n - Z.to_nat (o3 + 1%Z)) a)) ∧ (0%Z ≤ besti ∧ besti ≤ o3 + 1%Z) ∧ bestd = diff a besti ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ o3 + 1%Z -> bestd ≤ diff a j) -> (0%Z ≤ besti ∧ besti ≤ Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ Z.of_nat (length a) -> diff a besti ≤ diff a i)))) ∧ (o3 + 1%Z < 0%Z -> (0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ Z.of_nat (length a) -> diff a 0%Z ≤ diff a i)))))) ∧ (o1 + 1%Z < 0%Z -> (let o2 : Z := Z.abs 0%Z in let o3 : Z := n - 1%Z in (0%Z ≤ o3 + 1%Z -> (0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a)) ∧ 0%Z = list_sum (drop 0%nat (take (Z.to_nat n - 0%nat) a)) ∧ 0%Z ≤ 0%Z ∧ o2 = diff a 0%Z ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ 0%Z -> o2 ≤ diff a j)) ∧ (∀(bestd : Z) (besti : Z) (left1 : Z) (right1 : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o3) ∧ left1 = list_sum (drop 0%nat (take (Z.to_nat i - 0%nat) a)) ∧ right1 = list_sum (drop (Z.to_nat i) (take (Z.to_nat n - Z.to_nat i) a)) ∧ (0%Z ≤ besti ∧ besti ≤ i) ∧ bestd = diff a besti ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ i -> bestd ≤ diff a j) -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let d : Z := Z.abs (left1 + nth (Z.to_nat i) a inhabitant - (right1 - nth (Z.to_nat i) a inhabitant)) in if decide (d < bestd) then left1 + nth (Z.to_nat i) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) ∧ right1 - nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat (i + 1%Z)) (take (Z.to_nat n - Z.to_nat (i + 1%Z)) a)) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z) ∧ d = diff a (i + 1%Z) ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ i + 1%Z -> d ≤ diff a j) else left1 + nth (Z.to_nat i) a inhabitant = list_sum (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) ∧ right1 - nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat (i + 1%Z)) (take (Z.to_nat n - Z.to_nat (i + 1%Z)) a)) ∧ (0%Z ≤ besti ∧ besti ≤ i + 1%Z) ∧ bestd = diff a besti ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ i + 1%Z -> bestd ≤ diff a j))) ∧ (left1 = list_sum (drop 0%nat (take (Z.to_nat (o3 + 1%Z) - 0%nat) a)) ∧ right1 = list_sum (drop (Z.to_nat (o3 + 1%Z)) (take (Z.to_nat n - Z.to_nat (o3 + 1%Z)) a)) ∧ (0%Z ≤ besti ∧ besti ≤ o3 + 1%Z) ∧ bestd = diff a besti ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ o3 + 1%Z -> bestd ≤ diff a j) -> (0%Z ≤ besti ∧ besti ≤ Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ Z.of_nat (length a) -> diff a besti ≤ diff a i)))) ∧ (o3 + 1%Z < 0%Z -> (0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ Z.of_nat (length a) -> diff a 0%Z ≤ diff a i)))).
Admitted.
