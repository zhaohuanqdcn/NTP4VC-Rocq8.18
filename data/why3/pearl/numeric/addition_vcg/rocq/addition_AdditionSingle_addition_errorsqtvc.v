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
Theorem addition_errors'vc (a : usingle) (b : usingle) (c : usingle) (d : usingle) (e : usingle) (f : usingle) : Rle (Rabs (Rminus (to_real (uadd (uadd (uadd a b) c) (uadd d (uadd e f)))) (Rplus (Rplus (Rplus (Rplus (Rplus (to_real a) (to_real b)) (to_real c)) (to_real d)) (to_real e)) (to_real f)))) (Rmult (Rmult 5%R eps) (Rplus (Rplus (Rplus (Rplus (Rplus (Rabs (to_real a)) (Rabs (to_real b))) (Rabs (to_real c))) (Rabs (to_real d))) (Rabs (to_real e))) (Rabs (to_real f)))).
Proof.
Admitted.
