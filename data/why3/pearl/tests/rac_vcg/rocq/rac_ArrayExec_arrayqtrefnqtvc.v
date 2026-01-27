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
Inductive array (α : Type) :=
  | array'mk : Z -> (Z -> α) -> array α.
Axiom array_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (array α).
Global Existing Instance array_inhabited.
Arguments array'mk {α}.
Definition length {α : Type} (x : array α) := match x with |  array'mk a _ => a end.
Definition elts {α : Type} (x : array α) := match x with |  array'mk _ a => a end.
Axiom map_update : forall {α : Type} `{Inhabited α}, (Z -> α) -> Z -> α -> Z -> α.
Axiom map_update'def : forall  {α : Type} `{Inhabited α} (f : Z -> α) (i : Z) (x : α) (j : Z), map_update f i x j = (if decide (j = i) then x else f j).
Definition mixfix_lbrb' {α : Type} `{Inhabited α} (a : array α) (i : Z) : α := elts a i.
Theorem array'refn'vc {α : Type} `{Inhabited α} (self : array α) : 0%Z ≤ length self.
Admitted.
