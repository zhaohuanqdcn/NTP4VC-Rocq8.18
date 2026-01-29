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
Require Import prover.Functions.Config.
Open Scope Z_scope.
Definition extensionalEqual {α : Type} {β : Type} `{Inhabited α} `{Inhabited β} (f : α -> β) (g : α -> β) := ∀(x : α), f x = g x.
Axiom functionExtensionality : forall  {α : Type} {β : Type} `{Inhabited α} `{Inhabited β} (f : α -> β) (g : α -> β) (fact0 : extensionalEqual f g), f = g.
Axiom update : forall {α : Type} `{Inhabited α} {β : Type} `{Inhabited β}, (α -> β) -> α -> β -> α -> β.
Axiom update_def : forall  {α : Type} {β : Type} `{Inhabited α} `{Inhabited β} (f : α -> β) (x : α) (y : β) (z : α), update f x y z = (if decide (x = z) then y else f z).
Axiom identity : forall {α : Type} `{Inhabited α}, α -> α.
Axiom identity_def : forall  {α : Type} `{Inhabited α} (x : α), identity x = x.
Axiom compose : forall {α : Type} `{Inhabited α} {β : Type} `{Inhabited β} {γ : Type} `{Inhabited γ}, (β -> γ) -> (α -> β) -> α -> γ.
Axiom compose_def : forall  {α : Type} {β : Type} {γ : Type} `{Inhabited α} `{Inhabited β} `{Inhabited γ} (g : β -> γ) (f : α -> β) (x : α), compose g f x = g (f x).
Theorem identity_neutral'vc {α : Type} {β : Type} `{Inhabited α} `{Inhabited β} (f : α -> β) : compose f identity = f ∧ compose identity f = f.
Proof.
Admitted.
