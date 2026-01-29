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
Inductive buf (α : Type) :=
  | buf'mk : Z -> list α -> buf α.
Axiom buf_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (buf α).
Global Existing Instance buf_inhabited.
Arguments buf'mk {α}.
Definition h {α : Type} (x : buf α) := match x with |  buf'mk a _ => a end.
Definition xs {α : Type} (x : buf α) := match x with |  buf'mk _ a => a end.
Program Fixpoint take {α : Type} `{Inhabited α} (n : Z) (l : list α) : list α :=
match l with | [] => ([] : list α) | cons x xs1 => (if decide (n = 0%Z) then ([] : list α) else cons x (take (n - 1%Z) xs1)) end.
Admit Obligations.
Definition add {α : Type} `{Inhabited α} (x : α) (b : buf α) : buf α := buf'mk (h b) (cons x (xs b)).
Definition get {α : Type} `{Inhabited α} (b : buf α) : list α := take (h b) (xs b).
Theorem take_lemma'vc {α : Type} `{Inhabited α} (n : Z) (l1 : list α) (l2 : list α) (l3 : list α) (fact0 : 0%Z ≤ n) (fact1 : n ≤ Z.of_nat (length l1)) : take n (l1 ++ l2) = take n (l1 ++ l3).
Proof.
Admitted.
