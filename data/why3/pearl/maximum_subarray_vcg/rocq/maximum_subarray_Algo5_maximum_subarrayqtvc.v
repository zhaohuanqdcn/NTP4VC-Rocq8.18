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
Theorem maximum_subarray'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> ((∀(l : Z), 0%Z ≤ l ∧ l ≤ 0%Z -> list_sum (drop (Z.to_nat l) (take (0%nat - Z.to_nat l) a)) ≤ 0%Z) ∧ (0%Z ≤ 0%Z ∧ list_sum (drop 0%nat (take (0%nat - 0%nat) a)) = 0%Z) ∧ (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ 0%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ 0%Z) ∧ 0%Z ≤ 0%Z ∧ list_sum (drop 0%nat (take (0%nat - 0%nat) a)) = 0%Z) ∧ (∀(cl : Z) (hi : Z) (lo : Z) (curmax : Z) (maxsum : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (∀(l : Z), 0%Z ≤ l ∧ l ≤ i -> list_sum (drop (Z.to_nat l) (take (Z.to_nat i - Z.to_nat l) a)) ≤ curmax) ∧ ((0%Z ≤ cl ∧ cl ≤ i) ∧ list_sum (drop (Z.to_nat cl) (take (Z.to_nat i - Z.to_nat cl) a)) = curmax) ∧ (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ i -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ maxsum) ∧ (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ i) ∧ list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a)) = maxsum -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (curmax + nth (Z.to_nat i) a inhabitant < 0%Z) then if decide (maxsum < 0%Z) then (∀(l : Z), 0%Z ≤ l ∧ l ≤ i + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat (i + 1%Z) - Z.to_nat l) a)) ≤ 0%Z) ∧ ((0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z) ∧ list_sum (drop (Z.to_nat (i + 1%Z)) (take (Z.to_nat (i + 1%Z) - Z.to_nat (i + 1%Z)) a)) = 0%Z) ∧ (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ i + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ 0%Z) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z) ∧ list_sum (drop (Z.to_nat (i + 1%Z)) (take (Z.to_nat (i + 1%Z) - Z.to_nat (i + 1%Z)) a)) = 0%Z else (∀(l : Z), 0%Z ≤ l ∧ l ≤ i + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat (i + 1%Z) - Z.to_nat l) a)) ≤ 0%Z) ∧ ((0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z) ∧ list_sum (drop (Z.to_nat (i + 1%Z)) (take (Z.to_nat (i + 1%Z) - Z.to_nat (i + 1%Z)) a)) = 0%Z) ∧ (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ i + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ maxsum) ∧ (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ i + 1%Z) ∧ list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a)) = maxsum else if decide (maxsum < curmax + nth (Z.to_nat i) a inhabitant) then (∀(l : Z), 0%Z ≤ l ∧ l ≤ i + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat (i + 1%Z) - Z.to_nat l) a)) ≤ curmax + nth (Z.to_nat i) a inhabitant) ∧ ((0%Z ≤ cl ∧ cl ≤ i + 1%Z) ∧ list_sum (drop (Z.to_nat cl) (take (Z.to_nat (i + 1%Z) - Z.to_nat cl) a)) = curmax + nth (Z.to_nat i) a inhabitant) ∧ (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ i + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ curmax + nth (Z.to_nat i) a inhabitant) ∧ (0%Z ≤ cl ∧ cl ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z) ∧ list_sum (drop (Z.to_nat cl) (take (Z.to_nat (i + 1%Z) - Z.to_nat cl) a)) = curmax + nth (Z.to_nat i) a inhabitant else (∀(l : Z), 0%Z ≤ l ∧ l ≤ i + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat (i + 1%Z) - Z.to_nat l) a)) ≤ curmax + nth (Z.to_nat i) a inhabitant) ∧ ((0%Z ≤ cl ∧ cl ≤ i + 1%Z) ∧ list_sum (drop (Z.to_nat cl) (take (Z.to_nat (i + 1%Z) - Z.to_nat cl) a)) = curmax + nth (Z.to_nat i) a inhabitant) ∧ (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ i + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ maxsum) ∧ (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ i + 1%Z) ∧ list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a)) = maxsum)) ∧ ((∀(l : Z), 0%Z ≤ l ∧ l ≤ o1 + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat (o1 + 1%Z) - Z.to_nat l) a)) ≤ curmax) ∧ ((0%Z ≤ cl ∧ cl ≤ o1 + 1%Z) ∧ list_sum (drop (Z.to_nat cl) (take (Z.to_nat (o1 + 1%Z) - Z.to_nat cl) a)) = curmax) ∧ (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ o1 + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ maxsum) ∧ (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ o1 + 1%Z) ∧ list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a)) = maxsum -> (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ Z.of_nat (length a) -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ maxsum) ∧ (∃(l : Z) (h : Z), (0%Z ≤ l ∧ l ≤ h ∧ h ≤ Z.of_nat (length a)) ∧ list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) = maxsum)))) ∧ (o1 + 1%Z < 0%Z -> (∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ Z.of_nat (length a) -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ 0%Z) ∧ (∃(l : Z) (h : Z), (0%Z ≤ l ∧ l ≤ h ∧ h ≤ Z.of_nat (length a)) ∧ list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) = 0%Z)).
Admitted.
