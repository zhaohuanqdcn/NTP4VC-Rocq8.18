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
Require Import Why3.real.Sum.
Require Import Why3.ieee_float.RoundingMode.
Require Import Why3.ufloat.UDouble.
Require Import Why3.ufloat.HelperLemmas.
Require Import Why3.ufloat.UDoubleLemmas.
Open Scope Z_scope.
Axiom log_error : R.
Axiom log_error_bounds : Rle 0%R log_error ∧ Rle log_error 1%R.
Axiom log_cst_error : R.
Axiom log_cst_error_bounds : Rle 0%R log_cst_error ∧ Rle log_cst_error 1%R.
Axiom log_approx : udouble -> udouble.
Axiom log_approx'spec : forall  (x : udouble) (fact0 : Rlt 0%R (to_real x)), Rle (Rabs (Rminus (to_real (log_approx x)) (ln (to_real x)))) (Rplus (Rmult (Rabs (ln (to_real x))) log_error) log_cst_error).
Axiom exp_error : R.
Axiom exp_error_bounds : Rle 0%R exp_error ∧ Rle exp_error (Rdiv 1%R 2).
Axiom exp_approx : udouble -> udouble.
Axiom exp_approx'spec : forall  (x : udouble), Rle (Rabs (Rminus (to_real (exp_approx x)) (exp (to_real x)))) (Rmult exp_error (exp (to_real x))).
Theorem example2'vc (y : udouble) (x : udouble) (fact0 : Rle exp_error (Rdiv 1%R 4)) : let o1 : udouble := exp_approx y in Rle (Rabs (Rminus (to_real o1) (exp (to_real y)))) (Rmult exp_error (exp (to_real y))) -> (let o2 : udouble := exp_approx x in Rle (Rabs (Rminus (to_real o2) (exp (to_real x)))) (Rmult exp_error (exp (to_real x))) -> (let o3 : udouble := uadd o2 o1 in Rlt 0%R (to_real o3) ∧ (let result : udouble := log_approx o3 in Rle (Rabs (Rminus (to_real result) (ln (to_real o3)))) (Rplus (Rmult (Rabs (ln (to_real o3))) log_error) log_cst_error) -> (let exact : R := ln (Rplus (exp (to_real x)) (exp (to_real y))) in Rle (Rabs (Rminus (to_real result) exact)) (Rplus (Rplus (Rmult (Rabs exact) log_error) (Rmult (Ropp (ln (Rminus 1%R (Rplus (Rmult 2%R exp_error) eps)))) (Rplus 1%R log_error))) log_cst_error))))).
Proof.
Admitted.
