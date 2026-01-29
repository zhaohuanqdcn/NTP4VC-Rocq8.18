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
Theorem non_empty_seq'vc {α : Type} `{Inhabited α} (s : list α) (fact0 : 0%Z < Z.of_nat (length s)) : s = cons (nth 0%nat s inhabitant) (drop 1%nat s).
Proof.
Admitted.
