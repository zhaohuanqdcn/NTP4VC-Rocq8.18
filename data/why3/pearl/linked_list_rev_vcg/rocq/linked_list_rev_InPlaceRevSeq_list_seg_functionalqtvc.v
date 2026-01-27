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
Axiom memory : Type -> Type.
Axiom memory_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (memory α).
Global Existing Instance memory_inhabited.
Axiom next : Type.
Axiom next_inhabited : Inhabited next.
Global Existing Instance next_inhabited.
Axiom next_countable : Countable next.
Global Existing Instance next_countable.
Definition list_seg (next1 : loc -> loc) (p : loc) (s : list loc) (q : loc) := let n : Z := Z.of_nat (length s) in (∀(i : Z), 0%Z ≤ i ∧ i < n -> ¬ nth (Z.to_nat i) s inhabitant = null) ∧ (p = q ∧ n = 0%Z ∨ 1%Z ≤ n ∧ nth 0%nat s inhabitant = p ∧ next1 (nth (Z.to_nat (n - 1%Z)) s inhabitant) = q ∧ (∀(i : Z), 0%Z ≤ i ∧ i < n - 1%Z -> next1 (nth (Z.to_nat i) s inhabitant) = nth (Z.to_nat (i + 1%Z)) s inhabitant)).
Theorem list_seg_functional'vc (next1 : loc -> loc) (p : loc) (l1 : list loc) (l2 : list loc) (fact0 : list_seg next1 p l1 null) (fact1 : list_seg next1 p l2 null) : l1 = l2.
Admitted.
