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
Theorem example2'vc (a : usingle) (b : usingle) (c : usingle) : let t : R := Rplus 1%R eps in let t1 : R := Rplus eps (Rmult eps t) in let t2 : R := Rmult (Rplus (to_real a) (to_real b)) (to_real c) in let t3 : R := Rabs t2 in let t4 : R := Rmult (Rplus t t1) eta in Rle (Rabs (Rminus (to_real (uadd (umul (uadd a b) c) (umul (uadd a b) c))) (Rplus t2 t2))) (Rplus (Rmult (Rplus (Rplus t1 t1) eps) (Rplus t3 t3)) (Rplus t4 t4)).
Admitted.
