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
Axiom grid : Type.
Axiom grid_inhabited : Inhabited grid.
Global Existing Instance grid_inhabited.
Axiom grid_countable : Countable grid.
Global Existing Instance grid_countable.
Definition is_index (i : Z) := 0%Z ≤ i ∧ i < 81%Z.
Definition valid_values (g : Z -> Z) := ∀(i : Z), is_index i -> 0%Z ≤ g i ∧ g i ≤ 9%Z.
Definition grid_eq_sub (g1 : Z -> Z) (g2 : Z -> Z) (a : Z) (b : Z) := ∀(j : Z), a ≤ j ∧ j < b -> g1 j = g2 j.
Theorem grid_eq_sub'vc (a : Z) (b : Z) (g1 : Z -> Z) (g2 : Z -> Z) (fact0 : 0%Z ≤ a) (fact1 : a ≤ 81%Z) (fact2 : 0%Z ≤ b) (fact3 : b ≤ 81%Z) (fact4 : grid_eq_sub g1 g2 0%Z 81%Z) : grid_eq_sub g1 g2 a b.
Admitted.
