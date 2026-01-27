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
Axiom cursor : Type -> Type.
Axiom cursor_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (cursor α).
Global Existing Instance cursor_inhabited.
Axiom visited : forall {α : Type} `{Inhabited α}, cursor α -> list α.
Axiom collection : forall {α : Type} `{Inhabited α}, cursor α -> list α.
Axiom to_visit : forall {α : Type} `{Inhabited α}, cursor α -> list α.
Axiom cursor'invariant : forall  {α : Type} `{Inhabited α} (self : cursor α), visited self ++ to_visit self = collection self.
Definition cursor'eq {α : Type} `{Inhabited α} (a : cursor α) (b : cursor α) := visited a = visited b ∧ collection a = collection b ∧ to_visit a = to_visit b.
Axiom cursor'inj : forall  {α : Type} `{Inhabited α} (a : cursor α) (b : cursor α) (fact0 : cursor'eq a b), a = b.
Definition permitted {α : Type} `{Inhabited α} (c : cursor α) := Z.of_nat (length (visited c)) ≤ Z.of_nat (length (collection c)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (visited c)) -> nth (Z.to_nat i) (visited c) inhabitant = nth (Z.to_nat i) (collection c) inhabitant).
Definition complete {α : Type} `{Inhabited α} (c : cursor α) := length (visited c) = length (collection c).
Theorem snoc_Cons'vc {α : Type} `{Inhabited α} (s : list α) (x : α) (l : list α) : (s ++ [x]) ++ l = s ++ cons x l.
Admitted.
