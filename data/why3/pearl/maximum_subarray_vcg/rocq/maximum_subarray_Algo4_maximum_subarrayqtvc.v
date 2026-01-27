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
Require Import maximum_subarray_vcg.maximum_subarray.Spec.
Open Scope Z_scope.
Theorem maximum_subarray'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> (((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z) ∧ 0%Z ≤ 0%Z ∧ 0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a))) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ 0%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat h' - Z.to_nat l') a)) ≤ 0%Z) ∧ (0%Z ≤ 0%Z ∧ 0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a))) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < 0%Z -> list_sum (drop (Z.to_nat l') (take (0%nat - Z.to_nat l') a)) ≤ 0%Z)) ∧ (∀(s : Z) (l : Z) (ms : Z) (hi : Z) (lo : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ i) ∧ 0%Z ≤ ms ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ i -> list_sum (drop (Z.to_nat l') (take (Z.to_nat h' - Z.to_nat l') a)) ≤ ms) ∧ ((0%Z ≤ l ∧ l ≤ i) ∧ s = list_sum (drop (Z.to_nat l) (take (Z.to_nat i - Z.to_nat l) a))) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < i -> list_sum (drop (Z.to_nat l') (take (Z.to_nat i - Z.to_nat l') a)) ≤ s) -> (if decide (s < 0%Z) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (ms < nth (Z.to_nat i) a inhabitant) then ((0%Z ≤ i ∧ i ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z) ∧ 0%Z ≤ nth (Z.to_nat i) a inhabitant ∧ nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat i) (take (Z.to_nat (i + 1%Z) - Z.to_nat i) a))) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ i + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat h' - Z.to_nat l') a)) ≤ nth (Z.to_nat i) a inhabitant) ∧ ((0%Z ≤ i ∧ i ≤ i + 1%Z) ∧ nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat i) (take (Z.to_nat (i + 1%Z) - Z.to_nat i) a))) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < i + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat (i + 1%Z) - Z.to_nat l') a)) ≤ nth (Z.to_nat i) a inhabitant) else ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ i + 1%Z) ∧ 0%Z ≤ ms ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ i + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat h' - Z.to_nat l') a)) ≤ ms) ∧ ((0%Z ≤ i ∧ i ≤ i + 1%Z) ∧ nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat i) (take (Z.to_nat (i + 1%Z) - Z.to_nat i) a))) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < i + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat (i + 1%Z) - Z.to_nat l') a)) ≤ nth (Z.to_nat i) a inhabitant)) else (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (ms < s + nth (Z.to_nat i) a inhabitant) then ((0%Z ≤ l ∧ l ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z) ∧ 0%Z ≤ s + nth (Z.to_nat i) a inhabitant ∧ s + nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat l) (take (Z.to_nat (i + 1%Z) - Z.to_nat l) a))) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ i + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat h' - Z.to_nat l') a)) ≤ s + nth (Z.to_nat i) a inhabitant) ∧ ((0%Z ≤ l ∧ l ≤ i + 1%Z) ∧ s + nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat l) (take (Z.to_nat (i + 1%Z) - Z.to_nat l) a))) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < i + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat (i + 1%Z) - Z.to_nat l') a)) ≤ s + nth (Z.to_nat i) a inhabitant) else ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ i + 1%Z) ∧ 0%Z ≤ ms ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ i + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat h' - Z.to_nat l') a)) ≤ ms) ∧ ((0%Z ≤ l ∧ l ≤ i + 1%Z) ∧ s + nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat l) (take (Z.to_nat (i + 1%Z) - Z.to_nat l) a))) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < i + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat (i + 1%Z) - Z.to_nat l') a)) ≤ s + nth (Z.to_nat i) a inhabitant)))) ∧ (((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ o1 + 1%Z) ∧ 0%Z ≤ ms ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ o1 + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat h' - Z.to_nat l') a)) ≤ ms) ∧ ((0%Z ≤ l ∧ l ≤ o1 + 1%Z) ∧ s = list_sum (drop (Z.to_nat l) (take (Z.to_nat (o1 + 1%Z) - Z.to_nat l) a))) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < o1 + 1%Z -> list_sum (drop (Z.to_nat l') (take (Z.to_nat (o1 + 1%Z) - Z.to_nat l') a)) ≤ s) -> ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ Z.of_nat (length a)) ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ maxsub a ms))) ∧ (o1 + 1%Z < 0%Z -> ((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ 0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a))) ∧ maxsub a 0%Z).
Admitted.
