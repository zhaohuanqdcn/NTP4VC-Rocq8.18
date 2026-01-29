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
Require Import lse.my_exp_log.ExpLogLemmas.
Require Import lse.udouble.UDouble.
Require Import Why3.ieee_float.RoundingMode.
Open Scope Z_scope.
Axiom exp_max_value : R.
Axiom exp_max_value_spec : Rlt 0%R exp_max_value.
Axiom exp_error : R.
Axiom exp_error_bound : Rlt 0%R exp_error ∧ Rle exp_error (Rdiv 1%R 2).
Axiom u_exp : udouble -> udouble.
Axiom u_exp_spec : forall  (x : udouble) (fact0 : Rle (Rabs (to_real x)) exp_max_value), Rle (Rabs (Rminus (to_real (u_exp x)) (exp (to_real x)))) (Rmult (exp (to_real x)) exp_error).
Axiom log_max_value : R.
Axiom log_max_value_spec : Rlt 0%R log_max_value.
Axiom log_error : R.
Axiom log_error_bound : Rlt 0%R log_error ∧ Rle log_error 1%R.
Axiom u_log : udouble -> udouble.
Axiom u_log_spec : forall  (x : udouble) (fact0 : Rlt 0%R (to_real x)) (fact1 : Rle (to_real x) log_max_value), Rle (Rabs (Rminus (to_real (u_log x)) (ln (to_real x)))) (Rmult (Rabs (ln (to_real x))) log_error).
Axiom log2_error : R.
Axiom log2_error_bound : Rle 0%R log2_error ∧ Rle log2_error (Rdiv 1%R 4).
Theorem u_exp_bounds'vc (x : udouble) (fact0 : Rle (Rabs (to_real x)) exp_max_value) : Rle (Rdiv 7129813%R 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) (to_real (u_exp x)) ∧ Rle (to_real (u_exp x)) 10519210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%R.
Proof.
Admitted.
