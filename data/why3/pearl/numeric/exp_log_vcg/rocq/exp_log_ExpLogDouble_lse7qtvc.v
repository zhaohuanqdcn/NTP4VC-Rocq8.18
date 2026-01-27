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
Theorem lse7'vc (x7 : udouble) (x6 : udouble) (x5 : udouble) (x4 : udouble) (x3 : udouble) (x2 : udouble) (x1 : udouble) (fact0 : Rle exp_error (Rdiv 1%R 8)) : let o1 : udouble := exp_approx x7 in Rle (Rabs (Rminus (to_real o1) (exp (to_real x7)))) (Rmult exp_error (exp (to_real x7))) -> (let o2 : udouble := exp_approx x6 in Rle (Rabs (Rminus (to_real o2) (exp (to_real x6)))) (Rmult exp_error (exp (to_real x6))) -> (let o3 : udouble := exp_approx x5 in Rle (Rabs (Rminus (to_real o3) (exp (to_real x5)))) (Rmult exp_error (exp (to_real x5))) -> (let o4 : udouble := exp_approx x4 in Rle (Rabs (Rminus (to_real o4) (exp (to_real x4)))) (Rmult exp_error (exp (to_real x4))) -> (let o5 : udouble := exp_approx x3 in Rle (Rabs (Rminus (to_real o5) (exp (to_real x3)))) (Rmult exp_error (exp (to_real x3))) -> (let o6 : udouble := exp_approx x2 in Rle (Rabs (Rminus (to_real o6) (exp (to_real x2)))) (Rmult exp_error (exp (to_real x2))) -> (let o7 : udouble := exp_approx x1 in Rle (Rabs (Rminus (to_real o7) (exp (to_real x1)))) (Rmult exp_error (exp (to_real x1))) -> (let o8 : udouble := uadd (uadd (uadd (uadd (uadd (uadd o7 o6) o5) o4) o3) o2) o1 in Rlt 0%R (to_real o8) ∧ (let result : udouble := log_approx o8 in Rle (Rabs (Rminus (to_real result) (ln (to_real o8)))) (Rplus (Rmult (Rabs (ln (to_real o8))) log_error) log_cst_error) -> (let exact : R := ln (Rplus (Rplus (Rplus (Rplus (Rplus (Rplus (exp (to_real x1)) (exp (to_real x2))) (exp (to_real x3))) (exp (to_real x4))) (exp (to_real x5))) (exp (to_real x6))) (exp (to_real x7))) in Rle (Rabs (Rminus (to_real result) exact)) (Rplus (Rminus (Rmult (Rabs exact) log_error) (Rmult (ln (Rminus 1%R (Rplus (Rmult 7%R exp_error) (Rmult 6%R eps)))) (Rplus 1%R log_error))) log_cst_error)))))))))).
Admitted.
