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
Require Import schorr_waite_with_ghost_monitor_vcg.schorr_waite_with_ghost_monitor.Memory.
Open Scope Z_scope.
Definition edge (m : memory) (x : loc) (y : loc) := ¬ x = null ∧ (left1 m x = y ∨ right1 m x = y).
Inductive path : memory -> loc -> loc -> Prop :=
 | path_nil (m : memory) (x : loc) : path m x x
 | path_cons (m : memory) (x : loc) (y : loc) (z : loc) : edge m x y -> path m y z -> path m x z.
Definition well_colored_on (graph : gset loc) (gray : gset loc) (m : memory) (mark : loc -> bool) := gray ⊆ graph ∧ (∀(x : loc), x ∈ gray -> mark x = true) ∧ (∀(x : loc) (y : loc), x ∈ graph ∧ edge m x y ∧ ¬ y = null ∧ mark x = true -> x ∈ gray ∨ mark y = true).
Definition unchanged_structure (m1 : memory) (m2 : memory) := ∀(x : loc), ¬ x = null -> left1 m2 x = left1 m1 x ∧ right1 m2 x = right1 m1 x.
