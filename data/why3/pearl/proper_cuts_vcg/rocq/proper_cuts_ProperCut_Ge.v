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
Definition injective {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (f : α -> β) := ∀(x : α) (x' : α), ¬ x = x' -> ¬ f x = f x'.
Program Fixpoint map {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (f : α -> β) (l : list α) : list β :=
match l with | [] => ([] : list β) | cons x s => cons (f x) (map f s) end.
Admit Obligations.
Axiom map'spec'0 : forall  {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (y : β) (f : α -> β) (l : list α), (y ∈ map f l) = (∃(x : α), x ∈ l ∧ y = f x).
Axiom map'spec : forall  {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (l : list α) (f : α -> β) (fact0 : NoDup l) (fact1 : injective f), NoDup (map f l).
Definition cut {α : Type} `{Inhabited α} (l1 : list α) (l2 : list α) (l : list α) := l1 ++ l2 = l.
Axiom cut_list : Type -> Type.
Axiom cut_list_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (cut_list α).
Global Existing Instance cut_list_inhabited.
Definition proper_cuts {α : Type} `{Inhabited α} (c : list (list α * list α)) (l : list α) := NoDup c ∧ (∀(l1 : list α) (l2 : list α), ((l1, l2) ∈ c) = cut l1 l2 l).
Theorem Ge : proper_cuts (cons (([] : list Z), ([] : list Z)) ([] : list (list Z * list Z))) ([] : list Z).
Admitted.
