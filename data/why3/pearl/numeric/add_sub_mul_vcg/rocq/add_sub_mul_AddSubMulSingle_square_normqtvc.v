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
Theorem square_norm'vc (a : usingle) (b : usingle) (c : usingle) : let t1 : R := Rmult (to_real a) (to_real a) in let t2 : R := Rmult (to_real b) (to_real b) in let t3 : R := Rmult (to_real c) (to_real c) in Rle (Rabs (Rminus (to_real (uadd (uadd (umul a a) (umul b b)) (umul c c))) (Rplus (Rplus t1 t2) t3))) (Rplus (Rmult (Rmult 5%R eps) (Rplus (Rplus t1 t2) t3)) (Rmult eta (Rplus (Rplus (Rmult (Rmult 2%R (Rplus 1%R (Rmult 2%R eps))) (Rplus 1%R (Rmult 2%R eps))) 1%R) (Rmult 4%R eps)))).
Admitted.
