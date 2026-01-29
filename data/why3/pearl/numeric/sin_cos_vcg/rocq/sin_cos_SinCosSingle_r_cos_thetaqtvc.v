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
Require Import Why3.ufloat.USingle.
Require Import Why3.ufloat.HelperLemmas.
Require Import Why3.ufloat.USingleLemmas.
Open Scope Z_scope.
Axiom sin_rel_err : R.
Axiom sin_rel_err_range : Rle 0%R sin_rel_err.
Axiom sin_abs_err : R.
Axiom sin_abs_err_range : Rle 0%R sin_abs_err.
Axiom sin_max : R.
Axiom sin_max_range : Rle 0%R sin_max.
Axiom cos_rel_err : R.
Axiom cos_rel_err_range : Rle 0%R cos_rel_err.
Axiom cos_abs_err : R.
Axiom cos_abs_err_range : Rle 0%R cos_abs_err.
Axiom cos_max : R.
Axiom cos_max_range : Rle 0%R cos_max.
Theorem r_cos_theta'vc (r : usingle) (r_exact : R) (theta : usingle) (theta_exact : R) (r_err : R) (theta_err : R) (fact0 : Rle (Rdiv 3927%R 1250) cos_max) (fact1 : Rle 0%R (to_real r)) (fact2 : Rle (to_real r) 1%R) (fact3 : Rle 0%R r_exact) (fact4 : Rle r_exact 1%R) (fact5 : Rle (Ropp (Rdiv 3927%R 1250)) (to_real theta)) (fact6 : Rle (to_real theta) (Rdiv 3927%R 1250)) (fact7 : Rle (Ropp (Rdiv 3927%R 1250)) theta_exact) (fact8 : Rle theta_exact (Rdiv 3927%R 1250)) (fact9 : Rle (Rabs (Rminus (to_real r) r_exact)) r_err) (fact10 : Rle (Rabs (Rminus (to_real theta) theta_exact)) theta_err) : Rle (Rabs (to_real theta)) cos_max ∧ (∀(o1 : usingle), Rle (Rabs (Rminus (to_real o1) (cos (to_real theta)))) (Rplus (Rmult cos_rel_err (Rabs (cos (to_real theta)))) cos_abs_err) -> (let t1 : R := Rplus 1%R eps in let t3 : R := Rplus (Rmult theta_err (Rplus 1%R cos_rel_err)) cos_abs_err in Rle (Rabs (Rminus (to_real (umul r o1)) (Rmult r_exact (cos theta_exact)))) (Rplus (Rplus (Rmult (Rplus eps (Rmult cos_rel_err t1)) (Rabs (Rmult r_exact (cos theta_exact)))) (Rmult (Rplus (Rplus (Rmult t3 (Rabs r_exact)) (Rmult (Rplus r_err (Rmult r_err cos_rel_err)) (Rabs (cos theta_exact)))) (Rmult r_err t3)) t1)) eta))).
Proof.
Admitted.
