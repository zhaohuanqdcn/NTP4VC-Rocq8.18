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
Axiom t : Type -> Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α} {β : Type} `{Inhabited β}, Inhabited (t α β).
Global Existing Instance t_inhabited.
Axiom contents : forall {β : Type} `{Inhabited β} {α : Type} `{Inhabited α}, t α β -> α -> option β.
Definition mixfix_lbrb {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (h : t α β) (k : α) : option β := contents h k.
