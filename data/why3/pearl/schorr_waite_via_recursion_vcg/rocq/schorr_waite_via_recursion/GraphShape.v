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
Require Import schorr_waite_via_recursion_vcg.schorr_waite_via_recursion.Memory.
Open Scope Z_scope.
Definition black (c : color) := ¬ c = White.
Definition edge (m : memory) (x : loc) (y : loc) := ¬ x = null ∧ (∃(n : Z), (0%Z ≤ n ∧ n < block_size m x) ∧ accessor m x n = y).
Inductive path : memory -> loc -> loc -> Prop :=
 | path_nil (m : memory) (x : loc) : path m x x
 | path_cons (m : memory) (x : loc) (y : loc) (z : loc) : edge m x y -> path m y z -> path m x z.
Definition well_colored_on (graph : gset loc) (gray : gset loc) (m : memory) (cl : loc -> color) := gray ⊆ graph ∧ (∀(x : loc) (y : loc), x ∈ graph ∧ edge m x y ∧ ¬ y = null ∧ black (cl x) -> x ∈ gray ∨ black (cl y)) ∧ (∀(x : loc), x ∈ gray -> black (cl x)).
Definition unchanged (m1 : memory) (m2 : memory) := ∀(x : loc) (n : Z), ¬ x = null ∧ 0%Z ≤ n ∧ n < block_size m1 x -> accessor m2 x n = accessor m1 x n.
