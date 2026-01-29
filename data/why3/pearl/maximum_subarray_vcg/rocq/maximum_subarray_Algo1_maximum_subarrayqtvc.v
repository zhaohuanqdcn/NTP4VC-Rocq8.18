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
Require Import maximum_subarray_vcg.maximum_subarray.Spec.
Open Scope Z_scope.
Theorem maximum_subarray'vc (a : list Z) : let n : Z := Z.of_nat (length a) in let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> (((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z) ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ n) ∧ 0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a))) ∧ maxsublo a 0%Z 0%Z) ∧ (∀(ms : Z) (hi : Z) (lo : Z), (∀(l : Z), (0%Z ≤ l ∧ l ≤ o1) ∧ ((0%Z ≤ lo ∧ lo ≤ l) ∧ (lo ≤ hi ∧ hi ≤ n) ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ maxsublo a l ms -> (l ≤ n + 1%Z -> (((0%Z ≤ lo ∧ lo ≤ l) ∧ (lo ≤ hi ∧ hi ≤ n) ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ maxsublo a l ms ∧ (∀(h' : Z), l ≤ h' ∧ h' < l -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h' - Z.to_nat l) a)) ≤ ms)) ∧ (∀(ms1 : Z) (hi1 : Z) (lo1 : Z), (∀(h : Z), (l ≤ h ∧ h ≤ n) ∧ ((0%Z ≤ lo1 ∧ lo1 ≤ l) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a))) ∧ maxsublo a l ms1 ∧ (∀(h' : Z), l ≤ h' ∧ h' < h -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h' - Z.to_nat l) a)) ≤ ms1) -> (let o2 : Z := h - 1%Z in (l ≤ o2 + 1%Z -> (0%Z = list_sum (drop (Z.to_nat l) (take (Z.to_nat l - Z.to_nat l) a)) ∧ (0%Z ≤ lo1 ∧ lo1 ≤ l) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a))) ∧ (∀(s : Z), (∀(i : Z), (l ≤ i ∧ i ≤ o2) ∧ s = list_sum (drop (Z.to_nat l) (take (Z.to_nat i - Z.to_nat l) a)) ∧ (0%Z ≤ lo1 ∧ lo1 ≤ l) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a)) -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ s + nth (Z.to_nat i) a inhabitant = list_sum (drop (Z.to_nat l) (take (Z.to_nat (i + 1%Z) - Z.to_nat l) a)) ∧ (0%Z ≤ lo1 ∧ lo1 ≤ l) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a))) ∧ (s = list_sum (drop (Z.to_nat l) (take (Z.to_nat (o2 + 1%Z) - Z.to_nat l) a)) ∧ (0%Z ≤ lo1 ∧ lo1 ≤ l) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a)) -> (if decide (ms1 < s) then ((0%Z ≤ l ∧ l ≤ l) ∧ (l ≤ h ∧ h ≤ n) ∧ s = list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a))) ∧ maxsublo a l s ∧ (∀(h' : Z), l ≤ h' ∧ h' < h + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h' - Z.to_nat l) a)) ≤ s) else ((0%Z ≤ lo1 ∧ lo1 ≤ l) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a))) ∧ maxsublo a l ms1 ∧ (∀(h' : Z), l ≤ h' ∧ h' < h + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h' - Z.to_nat l) a)) ≤ ms1))))) ∧ (o2 + 1%Z < l -> (if decide (ms1 < 0%Z) then ((0%Z ≤ l ∧ l ≤ l) ∧ (l ≤ h ∧ h ≤ n) ∧ 0%Z = list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a))) ∧ maxsublo a l 0%Z ∧ (∀(h' : Z), l ≤ h' ∧ h' < h + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h' - Z.to_nat l) a)) ≤ 0%Z) else ((0%Z ≤ lo1 ∧ lo1 ≤ l) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a))) ∧ maxsublo a l ms1 ∧ (∀(h' : Z), l ≤ h' ∧ h' < h + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h' - Z.to_nat l) a)) ≤ ms1))))) ∧ (((0%Z ≤ lo1 ∧ lo1 ≤ l) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a))) ∧ maxsublo a l ms1 ∧ (∀(h' : Z), l ≤ h' ∧ h' < n + 1%Z -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h' - Z.to_nat l) a)) ≤ ms1) -> ((0%Z ≤ lo1 ∧ lo1 ≤ l + 1%Z) ∧ (lo1 ≤ hi1 ∧ hi1 ≤ n) ∧ ms1 = list_sum (drop (Z.to_nat lo1) (take (Z.to_nat hi1 - Z.to_nat lo1) a))) ∧ maxsublo a (l + 1%Z) ms1))) ∧ (n + 1%Z < l -> ((0%Z ≤ lo ∧ lo ≤ l + 1%Z) ∧ (lo ≤ hi ∧ hi ≤ n) ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ maxsublo a (l + 1%Z) ms)) ∧ (((0%Z ≤ lo ∧ lo ≤ o1 + 1%Z) ∧ (lo ≤ hi ∧ hi ≤ n) ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ maxsublo a (o1 + 1%Z) ms -> ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ Z.of_nat (length a)) ∧ ms = list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) ∧ maxsub a ms))) ∧ (o1 + 1%Z < 0%Z -> ((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ 0%Z = list_sum (drop 0%nat (take (0%nat - 0%nat) a))) ∧ maxsub a 0%Z).
Proof.
Admitted.
