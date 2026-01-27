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
Open Scope Z_scope.
Definition zero_at (l : list Z) (i : Z) := nth_error_i l i = Some 0%Z ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> ¬ nth_error_i l j = Some 0%Z).
Definition no_zero (l : list Z) := ∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length l) -> ¬ nth_error_i l j = Some 0%Z.
Theorem search_loop'vc (l : list Z) : 0%Z ≤ 0%Z ∧ 0%Z + Z.of_nat (length l) = Z.of_nat (length l) ∧ (∀(j : Z), 0%Z ≤ j -> nth_error_i l j = nth_error_i l (0%Z + j)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ nth_error_i l j = Some 0%Z) ∧ (∀(s : list Z) (i : Z), 0%Z ≤ i ∧ i + Z.of_nat (length s) = Z.of_nat (length l) ∧ (∀(j : Z), 0%Z ≤ j -> nth_error_i s j = nth_error_i l (i + j)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> ¬ nth_error_i l j = Some 0%Z) -> is_Nil s = (s = ([] : list Z)) -> (¬ is_Nil s -> ¬ s = ([] : list Z)) ∧ (∀(o1 : bool), (if decide (¬ is_Nil s) then ∃(o2 : Z), hd_error s = Some o2 ∧ o1 = (if decide (o2 = 0%Z) then false else true) else o1 = false) -> (if decide (o1 = true) then ¬ s = ([] : list Z) ∧ (∀(o2 : list Z), tl_error s = Some o2 -> (match s with | [] => False | cons _ f => f = o2 end) ∧ 0%Z ≤ i + 1%Z ∧ i + 1%Z + Z.of_nat (length o2) = Z.of_nat (length l) ∧ (∀(j : Z), 0%Z ≤ j -> nth_error_i o2 j = nth_error_i l (i + 1%Z + j)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> ¬ nth_error_i l j = Some 0%Z)) else (0%Z ≤ i ∧ i < Z.of_nat (length l)) ∧ zero_at l i ∨ i = Z.of_nat (length l) ∧ no_zero l))).
Admitted.
