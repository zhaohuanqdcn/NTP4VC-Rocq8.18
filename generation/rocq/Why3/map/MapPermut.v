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
Definition permut {α : Type} `{Inhabited α} (m1 : Z -> α) (m2 : Z -> α) (l : Z) (u : Z) := ∀(v : α), map_occ_list v m1 l u = map_occ_list v m2 l u.
Axiom permut_trans : forall  {α : Type} `{Inhabited α} (a1 : Z -> α) (a2 : Z -> α) (l : Z) (u : Z) (a3 : Z -> α) (fact0 : permut a1 a2 l u) (fact1 : permut a2 a3 l u), permut a1 a3 l u.
Axiom permut_exists : forall  {α : Type} `{Inhabited α} (a1 : Z -> α) (a2 : Z -> α) (l : Z) (u : Z) (i : Z) (fact0 : permut a1 a2 l u) (fact1 : l ≤ i) (fact2 : i < u), ∃(j : Z), (l ≤ j ∧ j < u) ∧ a1 j = a2 i.
