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
Theorem log_combine_err'vc (x : R) (b : R) (a : R) (x_approx : R) (fact0 : Rlt 0%R x) (fact1 : Rlt b (Rmult x (Rminus 1%R a))) (fact2 : Rle (Rabs (Rminus x_approx x)) (Rplus (Rmult x a) b)) : Rle (Rabs (Rminus (ln x_approx) (ln x))) (Ropp (ln (Rminus 1%R (Rplus a (Rdiv b x))))).
Proof.
Admitted.
