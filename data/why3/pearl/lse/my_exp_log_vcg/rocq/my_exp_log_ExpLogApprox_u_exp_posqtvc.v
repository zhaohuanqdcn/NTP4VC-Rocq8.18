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
Theorem u_exp_pos'vc (x : udouble) (fact0 : Rle (Rabs (to_real x)) exp_max_value) : Rlt 0%R (to_real (u_exp x)).
Admitted.
