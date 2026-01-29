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
Theorem raytracer'vc (phi : udouble) (theta : udouble) (nz : udouble) (ny : udouble) (nx : udouble) (fact0 : Rle (Rabs (to_real phi)) sin_max) (fact1 : Rle (Rabs (to_real phi)) cos_max) (fact2 : Rle (Rabs (to_real theta)) sin_max) (fact3 : Rle (Rabs (to_real theta)) cos_max) : Rle (Rabs (to_real phi)) sin_max ∧ (∀(o1 : udouble), Rle (Rabs (Rminus (to_real o1) (sin (to_real phi)))) (Rplus (Rmult sin_rel_err (Rabs (sin (to_real phi)))) sin_abs_err) -> Rle (Rabs (to_real theta)) cos_max ∧ (∀(o2 : udouble), Rle (Rabs (Rminus (to_real o2) (cos (to_real theta)))) (Rplus (Rmult cos_rel_err (Rabs (cos (to_real theta)))) cos_abs_err) -> Rle (Rabs (to_real theta)) sin_max ∧ (∀(o3 : udouble), Rle (Rabs (Rminus (to_real o3) (sin (to_real theta)))) (Rplus (Rmult sin_rel_err (Rabs (sin (to_real theta)))) sin_abs_err) -> Rle (Rabs (to_real phi)) cos_max ∧ (∀(o4 : udouble), Rle (Rabs (Rminus (to_real o4) (cos (to_real phi)))) (Rplus (Rmult cos_rel_err (Rabs (cos (to_real phi)))) cos_abs_err) -> Rle (Rabs (to_real theta)) cos_max ∧ (∀(o5 : udouble), Rle (Rabs (Rminus (to_real o5) (cos (to_real theta)))) (Rplus (Rmult cos_rel_err (Rabs (cos (to_real theta)))) cos_abs_err) -> (let nz1 : R := to_real nz in let ny1 : R := to_real ny in let nx1 : R := to_real nx in let phi1 : R := to_real phi in let theta1 : R := to_real theta in let t1 : R := Rplus 1%R eps in let t2c : R := Rplus eps (Rmult cos_rel_err t1) in let t2s : R := Rplus eps (Rmult sin_rel_err t1) in let t3c : R := Rplus eps (Rmult (Rplus (Rplus t2c cos_rel_err) (Rmult t2c cos_rel_err)) t1) in let t3s : R := Rplus eps (Rmult (Rplus (Rplus t2c sin_rel_err) (Rmult t2c sin_rel_err)) t1) in let t4 : R := Rplus (Rplus t3c t2s) eps in Rle (Rabs (Rminus (to_real (uadd (uadd (umul (umul nx o5) o4) (umul ny o3)) (umul (umul nz o2) o1))) (Rplus (Rplus (Rmult (Rmult nx1 (cos theta1)) (cos phi1)) (Rmult ny1 (sin theta1))) (Rmult (Rmult nz1 (cos theta1)) (sin phi1))))) (Rplus (Rplus (Rmult (Rplus (Rplus t4 t3s) eps) (Rplus (Rplus (Rabs (Rmult (Rmult nx1 (cos theta1)) (cos phi1))) (Rabs (Rmult ny1 (sin theta1)))) (Rabs (Rmult (Rmult nz1 (cos theta1)) (sin phi1))))) (Rmult (Rplus t1 t3s) (Rplus (Rmult (Rplus t1 t2s) (Rplus (Rmult t1 (Rplus (Rmult (Rmult cos_abs_err (Rplus 1%R t2c)) (Rabs (Rmult nx1 (cos theta1)))) (Rmult (Rplus (Rmult (Rmult t1 cos_abs_err) (Rabs nx1)) eta) (Rplus (Rmult (Rplus 1%R cos_rel_err) (Rabs (cos phi1))) cos_abs_err)))) eta)) (Rmult (Rplus t1 t3c) (Rplus (Rmult (Rmult t1 sin_abs_err) (Rabs ny1)) eta))))) (Rmult (Rplus t1 t4) (Rplus (Rmult t1 (Rplus (Rmult (Rmult sin_abs_err (Rplus 1%R t2c)) (Rabs (Rmult nz1 (cos theta1)))) (Rmult (Rplus (Rmult (Rmult t1 cos_abs_err) (Rabs nz1)) eta) (Rplus (Rmult (Rplus 1%R sin_rel_err) (Rabs (sin phi1))) sin_abs_err)))) eta))))))))).
Proof.
Admitted.
