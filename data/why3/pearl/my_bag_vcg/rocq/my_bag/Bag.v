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
Axiom bag : Type -> Type.
Axiom bag_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (bag α).
Global Existing Instance bag_inhabited.
Definition infix_eqeq {α : Type} `{Inhabited α} (b1 : α -> Z) (b2 : α -> Z) := ∀(x : α), b1 x = b2 x.
Axiom add : forall {α : Type} `{Inhabited α}, α -> (α -> Z) -> α -> Z.
Axiom add'def : forall  {α : Type} `{Inhabited α} (e : α) (b : α -> Z) (x : α), add e b x = (if decide (x = e) then b x + 1%Z else b x).
Axiom remove : forall {α : Type} `{Inhabited α}, α -> (α -> Z) -> α -> Z.
Axiom remove'def : forall  {α : Type} `{Inhabited α} (e : α) (b : α -> Z) (x : α), remove e b x = (if decide (x = e) then b x - 1%Z else b x).
