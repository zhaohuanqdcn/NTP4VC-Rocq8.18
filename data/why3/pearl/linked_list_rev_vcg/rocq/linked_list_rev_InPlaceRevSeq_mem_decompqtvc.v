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
Open Scope Z_scope.
Axiom result : forall {α : Type} `{Inhabited α}, list α -> Z -> α.
Axiom result'def : forall  {α : Type} `{Inhabited α} (s : list α) (i : Z), result s i = nth (Z.to_nat (Z.of_nat (length s) - 1%Z - i)) s inhabitant.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Axiom eq_loc : loc -> loc -> bool.
Axiom eq_loc'spec : forall  (l1 : loc) (l2 : loc), (eq_loc l1 l2 = true) = (l1 = l2).
Definition disjoint {α : Type} `{Inhabited α} (s1 : list α) (s2 : list α) := ∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < Z.of_nat (length s1) -> (∀(i2 : Z), 0%Z ≤ i2 ∧ i2 < Z.of_nat (length s2) -> ¬ nth (Z.to_nat i1) s1 inhabitant = nth (Z.to_nat i2) s2 inhabitant).
Definition no_repet (s : list loc) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> ¬ nth (Z.to_nat i) s inhabitant ∈ drop (Z.to_nat (i + 1%Z)) s.
Theorem mem_decomp'vc (x : loc) (s : list loc) (fact0 : x ∈ s) : let o1 : loc := nth 0%nat s inhabitant in let o2 : bool := eq_loc o1 x in (o2 = true) = (o1 = x) -> (if decide (o2 = true) then 0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (length s) else (0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (length s)) ∧ (let o3 : list loc := drop 1%nat s in (0%Z ≤ Z.of_nat (length s) ∧ Z.of_nat (length o3) < Z.of_nat (length s)) ∧ x ∈ o3)) ∧ (∀(s1 : list loc) (s2 : list loc), (if decide (o2 = true) then s1 = ([] : list loc) ∧ s2 = drop 1%nat s else ∃(s11 : list loc), drop 1%nat s = s11 ++ cons x s2 ∧ (let o3 : loc := nth 0%nat s inhabitant in let o4 : list loc := cons o3 s11 in (Z.of_nat (length o4) = 1%Z + Z.of_nat (length s11) ∧ nth 0%nat o4 inhabitant = o3 ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length s11) -> nth (Z.to_nat i) o4 inhabitant = nth (Z.to_nat (i - 1%Z)) s11 inhabitant)) ∧ s1 = o4)) -> s = s1 ++ cons x s2).
Admitted.
