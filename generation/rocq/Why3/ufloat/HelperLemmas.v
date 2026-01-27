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
Require Import Why3.real.Sum.
Open Scope Z_scope.
Axiom log_1_minus_x : forall  (x : R) (fact0 : Rle 0%R (Rabs x)) (fact1 : Rlt (Rabs x) 1%R), Rle (ln (Rplus 1%R x)) (Ropp (ln (Rminus 1%R x))).
Axiom log2_1_minus_x : forall  (x : R) (fact0 : Rle 0%R (Rabs x)) (fact1 : Rlt (Rabs x) 1%R), Rle (Rlog 2 (Rplus 1%R x)) (Ropp (Rlog 2 (Rminus 1%R x))).
Axiom log10_1_minus_x : forall  (x : R) (fact0 : Rle 0%R (Rabs x)) (fact1 : Rlt (Rabs x) 1%R), Rle (Rlog 10 (Rplus 1%R x)) (Ropp (Rlog 10 (Rminus 1%R x))).
Axiom sin_of_approx : forall  (x : R) (y : R), Rle (Rabs (Rminus (sin x) (sin y))) (Rabs (Rminus x y)).
Axiom cos_of_approx : forall  (x : R) (y : R), Rle (Rabs (Rminus (cos x) (cos y))) (Rabs (Rminus x y)).
