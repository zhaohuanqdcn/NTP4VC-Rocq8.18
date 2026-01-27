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
Theorem kinematics'vc (theta1 : usingle) (theta2 : usingle) (fact0 : Rle (Rabs (to_real theta1)) (Rmult (Rdiv 1%R 4) sin_max)) (fact1 : Rle (Rabs (to_real theta2)) (Rmult (Rdiv 1%R 4) sin_max)) : let o1 : usingle := uadd theta1 theta2 in Rle (Rabs (to_real o1)) sin_max ∧ (∀(o2 : usingle), Rle (Rabs (Rminus (to_real o2) (sin (to_real o1)))) (Rplus (Rmult sin_rel_err (Rabs (sin (to_real o1)))) sin_abs_err) -> (∀(o3 : usingle), to_real o3 = Rdiv 5%R 2 -> Rle (Rabs (to_real theta1)) sin_max ∧ (∀(o4 : usingle), Rle (Rabs (Rminus (to_real o4) (sin (to_real theta1)))) (Rplus (Rmult sin_rel_err (Rabs (sin (to_real theta1)))) sin_abs_err) -> (∀(o5 : usingle), to_real o5 = Rdiv 1%R 2 -> (let theta11 : R := to_real theta1 in let theta21 : R := to_real theta2 in let t1 : R := Rplus 1%R eps in let t2 : R := Rplus eps (Rmult sin_rel_err t1) in Rle (Rabs (Rminus (to_real (uadd (umul o5 o4) (umul o3 o2))) (Rplus (Rmult (Rdiv 1%R 2) (sin theta11)) (Rmult (Rdiv 5%R 2) (sin (Rplus theta11 theta21)))))) (Rplus (Rmult (Rplus (Rmult 2%R t2) eps) (Rplus (Rmult (Rdiv 1%R 2) (Rabs (sin theta11))) (Rmult (Rdiv 5%R 2) (Rabs (sin (Rplus theta11 theta21)))))) (Rmult (Rplus t1 t2) (Rplus (Rmult t1 (Rplus (Rmult (Rdiv 1%R 2) sin_abs_err) (Rmult (Rdiv 5%R 2) (Rplus (Rmult (Rmult eps (Rabs (Rplus theta11 theta21))) (Rplus 1%R sin_rel_err)) sin_abs_err)))) (Rmult 2%R eta))))))))).
Admitted.
