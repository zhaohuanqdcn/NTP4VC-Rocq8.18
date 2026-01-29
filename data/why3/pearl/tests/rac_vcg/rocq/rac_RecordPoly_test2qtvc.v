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
Inductive t1 (α : Type) :=
  | t1'mk : α -> t1 α.
Axiom t1_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t1 α).
Global Existing Instance t1_inhabited.
Arguments t1'mk {α}.
Definition x {α : Type} (x : t1 α) := match x with |  t1'mk a => a end.
Inductive t2 (α : Type) :=
  | t2'mk : (Z -> α) -> t2 α.
Axiom t2_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t2 α).
Global Existing Instance t2_inhabited.
Arguments t2'mk {α}.
Definition f {α : Type} (x : t2 α) := match x with |  t2'mk a => a end.
Axiom o1 : Z -> bool.
Axiom o'def : forall  (x : Z), o1 x = true.
Theorem test2'vc : True.
Proof.
Admitted.
