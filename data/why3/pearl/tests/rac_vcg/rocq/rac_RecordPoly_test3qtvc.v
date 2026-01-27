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
Inductive t3 (α : Type) :=
  | t3'mk : (Z -> α) -> Z -> t3 α.
Axiom t3_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t3 α).
Global Existing Instance t3_inhabited.
Arguments t3'mk {α}.
Definition elts {α : Type} (x : t3 α) := match x with |  t3'mk a _ => a end.
Definition length {α : Type} (x : t3 α) := match x with |  t3'mk _ a => a end.
Axiom o1 : Z -> bool.
Axiom o2 : Z -> bool.
Axiom o'def : forall  (x : Z), o1 x = true.
Axiom o'def1 : forall  (x : Z), o2 x = true.
Theorem test3'vc : 0%Z < 3%Z ∧ 3%Z < 5%Z.
Admitted.
