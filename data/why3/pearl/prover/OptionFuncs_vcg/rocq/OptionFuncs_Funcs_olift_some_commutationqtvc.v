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
Require Import prover.Functions.Func.
Open Scope Z_scope.
Axiom some : forall {α : Type} `{Inhabited α}, α -> option α.
Axiom some_def : forall  {α : Type} `{Inhabited α} (x : α), some x = Some x.
Axiom ocase : forall {α : Type} `{Inhabited α} {β : Type} `{Inhabited β}, (α -> β) -> β -> option α -> β.
Axiom ocase_def : forall  {α : Type} {β : Type} `{Inhabited α} `{Inhabited β} (f : α -> β) (d : β) (x : option α), ocase f d x = (match x with | None => d | Some x1 => f x1 end).
Definition omap {α : Type} {β : Type} `{Inhabited α} `{Inhabited β} (f : α -> β) (x : option α) : option β := match x with | None => (None : option β) | Some x1 => Some (f x1) end.
Definition olift {α : Type} {β : Type} `{Inhabited α} `{Inhabited β} (f : α -> β) : option α -> option β := ocase (compose some f) (None : option β).
Theorem olift_some_commutation'vc {α : Type} {β : Type} `{Inhabited α} `{Inhabited β} (f : α -> β) : compose some f = compose ((olift : (α -> β) -> option α -> option β) f) some.
Proof.
Admitted.
