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
Theorem map'vc {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (l : list α) (f : α -> β) : (match l with | [] => True | cons x s => (match l with | [] => False | cons _ f => f = s end) end) ∧ (∀(r : list β), (match l with | [] => r = ([] : list β) | cons x s => (∃(o1 : list β), ((∀(y : β), (y ∈ o1) = (∃(x1 : α), x1 ∈ s ∧ y = f x1)) ∧ (NoDup s -> injective f -> NoDup o1)) ∧ r = cons (f x) o1) end) -> (∀(y : β), (y ∈ r) = (∃(x : α), x ∈ l ∧ y = f x)) ∧ (NoDup l -> injective f -> NoDup r)).
Proof.
Admitted.
