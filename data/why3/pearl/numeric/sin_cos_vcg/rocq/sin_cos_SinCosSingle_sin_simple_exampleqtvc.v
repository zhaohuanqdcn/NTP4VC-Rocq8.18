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
Theorem sin_simple_example'vc (a : usingle) (b : usingle) (fact0 : Rle (Rabs (to_real a)) (Rmult (Rdiv 1%R 4) sin_max)) (fact1 : Rle (Rabs (to_real b)) (Rmult (Rdiv 1%R 4) sin_max)) : let o1 : usingle := uadd a b in Rle (Rabs (to_real o1)) sin_max ∧ (∀(result : usingle), Rle (Rabs (Rminus (to_real result) (sin (to_real o1)))) (Rplus (Rmult sin_rel_err (Rabs (sin (to_real o1)))) sin_abs_err) -> Rle (Rabs (Rminus (to_real result) (sin (Rplus (to_real a) (to_real b))))) (Rplus (Rplus (Rmult sin_rel_err (Rabs (sin (Rplus (to_real a) (to_real b))))) (Rmult (Rmult eps (Rabs (Rplus (to_real a) (to_real b)))) (Rplus 1%R sin_rel_err))) sin_abs_err)).
Admitted.
