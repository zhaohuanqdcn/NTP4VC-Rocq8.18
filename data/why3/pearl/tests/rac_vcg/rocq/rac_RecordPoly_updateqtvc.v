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
Inductive t3 (α : Type) :=
  | t3'mk : (Z -> α) -> Z -> t3 α.
Axiom t3_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t3 α).
Global Existing Instance t3_inhabited.
Arguments t3'mk {α}.
Definition elts {α : Type} (x : t3 α) := match x with |  t3'mk a _ => a end.
Definition length {α : Type} (x : t3 α) := match x with |  t3'mk _ a => a end.
Axiom o1 : forall {α : Type} `{Inhabited α}, Z -> α -> (Z -> α) -> Z -> α.
Axiom o'def : forall  {α : Type} `{Inhabited α} (i : Z) (x1 : α) (f1 : Z -> α) (j : Z), o1 i x1 f1 j = (if decide (j = i) then x1 else f1 j).
Theorem update'vc {α : Type} `{Inhabited α} (i : Z) (r : t3 α) (r1 : t3 α) (x1 : α) (fact0 : 0%Z < i) (fact1 : i < length r) (fact2 : ∀(j : Z), elts r1 j = (if decide (j = i) then x1 else elts r j)) (fact3 : length r1 = length r) : (∀(j : Z), 0%Z < j ∧ j < length r1 -> ¬ j = i -> elts r1 j = elts r j) ∧ elts r1 i = x1.
Proof.
Admitted.
