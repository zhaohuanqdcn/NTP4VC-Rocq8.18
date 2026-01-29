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
Theorem cos_and_sine_example'vc (a : udouble) (fact0 : Rle (Rabs (to_real a)) sin_max) (fact1 : Rle (Rabs (to_real a)) cos_max) : Rle (Rabs (to_real a)) sin_max ∧ (∀(o1 : udouble), Rle (Rabs (Rminus (to_real o1) (sin (to_real a)))) (Rplus (Rmult sin_rel_err (Rabs (sin (to_real a)))) sin_abs_err) -> Rle (Rabs (to_real a)) sin_max ∧ (∀(o2 : udouble), Rle (Rabs (Rminus (to_real o2) (sin (to_real a)))) (Rplus (Rmult sin_rel_err (Rabs (sin (to_real a)))) sin_abs_err) -> Rle (Rabs (to_real a)) cos_max ∧ (∀(o3 : udouble), Rle (Rabs (Rminus (to_real o3) (cos (to_real a)))) (Rplus (Rmult cos_rel_err (Rabs (cos (to_real a)))) cos_abs_err) -> Rle (Rabs (to_real a)) cos_max ∧ (∀(o4 : udouble), Rle (Rabs (Rminus (to_real o4) (cos (to_real a)))) (Rplus (Rmult cos_rel_err (Rabs (cos (to_real a)))) cos_abs_err) -> (let a1 : R := to_real a in let t : R := Rplus 1%R eps in let crel : R := Rplus eps (Rmult (Rmult cos_rel_err (Rplus 2%R cos_rel_err)) t) in let srel : R := Rplus eps (Rmult (Rmult sin_rel_err (Rplus 2%R sin_rel_err)) t) in Rle (Rabs (Rminus (to_real (uadd (umul o4 o3) (umul o2 o1))) 1%R)) (Rplus (Rplus (Rplus (Rplus crel srel) eps) (Rmult (Rplus t srel) (Rplus (Rmult (Rmult t cos_abs_err) (Rplus (Rmult (Rmult 2%R (Rplus 1%R cos_rel_err)) (Rabs (cos a1))) cos_abs_err)) eta))) (Rmult (Rplus t crel) (Rplus (Rmult (Rmult t sin_abs_err) (Rplus (Rmult (Rmult 2%R (Rplus 1%R sin_rel_err)) (Rabs (sin a1))) sin_abs_err)) eta)))))))).
Proof.
Admitted.
