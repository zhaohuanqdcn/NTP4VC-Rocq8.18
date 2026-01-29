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
Theorem test4'vc : True.
Proof.
Admitted.
