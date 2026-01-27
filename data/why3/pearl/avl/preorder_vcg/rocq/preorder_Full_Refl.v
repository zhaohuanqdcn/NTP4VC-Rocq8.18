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
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom le : t -> t -> Prop.
Axiom Refl : forall  (x : t), le x x.
Axiom Trans : forall  (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom eq : t -> t -> Prop.
Axiom eq_def : forall  (x : t) (y : t), eq x y = (le x y ∧ le y x).
Axiom lt : t -> t -> Prop.
Axiom lt_def : forall  (x : t) (y : t), lt x y = (le x y ∧ ¬ le y x).
Theorem Refl1 (x : t) : eq x x.
Admitted.
