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
Axiom o1 : forall {α : Type} `{Inhabited α}, α -> Z -> α.
Axiom o2 : forall {α : Type} `{Inhabited α}, α -> Z -> α.
Axiom o'def : forall  {α : Type} `{Inhabited α} (v : α) (x : Z), o1 v x = v.
Axiom o'def1 : forall  {α : Type} `{Inhabited α} (v : α) (x : Z), o2 v x = v.
Theorem make'vc {α : Type} `{Inhabited α} (i : Z) (n : Z) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < n) : o2 v i = v.
Proof.
Admitted.
