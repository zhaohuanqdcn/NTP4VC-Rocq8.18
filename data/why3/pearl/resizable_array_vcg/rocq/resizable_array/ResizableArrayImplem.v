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
Axiom rarray : Type -> Type.
Axiom rarray_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (rarray α).
Global Existing Instance rarray_inhabited.
Axiom dummy : forall {α : Type} `{Inhabited α}, rarray α -> α.
Axiom length : forall {α : Type} `{Inhabited α}, rarray α -> Z.
Axiom data : forall {α : Type} `{Inhabited α}, rarray α -> list α.
Axiom rarray'invariant : forall  {α : Type} `{Inhabited α} (self : rarray α), 0%Z ≤ length self ∧ length self ≤ Z.of_nat (List.length (data self)) ∧ (∀(i : Z), length self ≤ i ∧ i < Z.of_nat (List.length (data self)) -> nth (Z.to_nat i) (data self) inhabitant = dummy self).
Definition rarray'eq {α : Type} `{Inhabited α} (a : rarray α) (b : rarray α) := dummy a = dummy b ∧ length a = length b ∧ data a = data b.
Axiom rarray'inj : forall  {α : Type} `{Inhabited α} (a : rarray α) (b : rarray α) (fact0 : rarray'eq a b), a = b.
Definition mixfix_lbrb {α : Type} `{Inhabited α} (r : rarray α) (i : Z) : α := nth (Z.to_nat i) (data r) inhabitant.
