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
Axiom cons : forall {α : Type} `{Inhabited α}, α -> list α * list α -> list α * list α.
Axiom cons'def : forall  {α : Type} `{Inhabited α} (x : α) (l : list α * list α), cons x l = (match l with | (l1, l2) => (List.cons x l1, l2) end).
Axiom cons'spec'0 : forall  {α : Type} `{Inhabited α} (x : α), injective (cons x).
Axiom cons'spec : forall  {α : Type} `{Inhabited α} (l1 : list α) (l2 : list α) (x : α) (l : list (list α * list α)), ((l1, l2) ∈ map (cons x) l) = (∃(s1 : list α), l1 = List.cons x s1 ∧ (s1, l2) ∈ l).
Theorem proper_cuts'vc {α : Type} `{Inhabited α} (l : list α) : (match l with | [] => True | List.cons x r => (match l with | [] => False | List.cons _ f => f = r end) end) ∧ (∀(r : list (list α * list α)), (match l with | [] => r = List.cons (([] : list α), ([] : list α)) ([] : list (list α * list α)) | List.cons x r1 => (∃(pr : list (list α * list α)), proper_cuts pr r1 ∧ (let o1 : list α * list α -> list α * list α := cons x in (injective o1 ∧ (∀(l1 : list (list α * list α)) (l11 : list α) (l2 : list α), ((l11, l2) ∈ map o1 l1) = (∃(s1 : list α), l11 = List.cons x s1 ∧ (s1, l2) ∈ l1))) ∧ (let r2 : list (list α * list α) := map o1 pr in ((∀(y : list α * list α), (y ∈ r2) = (∃(x1 : list α * list α), x1 ∈ pr ∧ y = o1 x1)) ∧ (NoDup pr -> injective o1 -> NoDup r2)) ∧ r = List.cons (([] : list α), l) r2))) end) -> proper_cuts r l).
Proof.
Admitted.
