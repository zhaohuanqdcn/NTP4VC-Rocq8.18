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
Inductive t (α : Type) :=
  | t'mk : (Z -> α) -> t α.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Arguments t'mk {α}.
Definition f {α : Type} (x : t α) := match x with |  t'mk a => a end.
Axiom map_update : forall {α : Type} `{Inhabited α}, (Z -> α) -> Z -> α -> Z -> α.
Axiom map_update'def : forall  {α : Type} `{Inhabited α} (f1 : Z -> α) (i : Z) (x : α) (j : Z), map_update f1 i x j = (if decide (j = i) then x else f1 j).
Axiom o1 : Z -> Z.
Axiom o'def : forall  (x : Z), o1 x = 0%Z.
Theorem test2'vc : True.
Admitted.
