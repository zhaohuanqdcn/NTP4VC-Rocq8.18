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
Inductive list (α : Type) :=
  | Nil : list α
  | Cons : α -> list α -> list α.
Axiom list_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (list α).
Global Existing Instance list_inhabited.
Arguments Nil {α}.
Arguments Cons {α}.
Program Fixpoint length {α : Type} `{Inhabited α} (l : list α) : Z :=
match l with | Nil => 0%Z | Cons _ r => 1%Z + length r end.
Admit Obligations.
Theorem lemma_length_non_neg'vc {α : Type} `{Inhabited α} (l : list α) : (match l with | Nil => True | Cons _ r => (match l with | Nil => False | Cons _ f => f = r end) end) ∧ ((match l with | Nil => True | Cons _ r => 0%Z ≤ length r end) -> 0%Z ≤ length l).
Proof.
Admitted.
