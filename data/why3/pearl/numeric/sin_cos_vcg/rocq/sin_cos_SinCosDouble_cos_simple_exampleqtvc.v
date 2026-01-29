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
Theorem cos_simple_example'vc (a : udouble) (b : udouble) (fact0 : Rle (Rabs (to_real a)) (Rmult (Rdiv 1%R 4) cos_max)) (fact1 : Rle (Rabs (to_real b)) (Rmult (Rdiv 1%R 4) cos_max)) : let o1 : udouble := usub a b in Rle (Rabs (to_real o1)) cos_max ∧ (∀(result : udouble), Rle (Rabs (Rminus (to_real result) (cos (to_real o1)))) (Rplus (Rmult cos_rel_err (Rabs (cos (to_real o1)))) cos_abs_err) -> Rle (Rabs (Rminus (to_real result) (cos (Rminus (to_real a) (to_real b))))) (Rplus (Rplus (Rmult cos_rel_err (Rabs (cos (Rminus (to_real a) (to_real b))))) (Rmult (Rmult eps (Rabs (Rminus (to_real a) (to_real b)))) (Rplus 1%R cos_rel_err))) cos_abs_err)).
Proof.
Admitted.
