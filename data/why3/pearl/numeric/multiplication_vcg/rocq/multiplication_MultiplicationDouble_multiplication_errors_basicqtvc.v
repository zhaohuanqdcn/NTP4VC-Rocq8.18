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
Theorem multiplication_errors_basic'vc (a : udouble) (b : udouble) (c : udouble) : let exact : R := Rmult (Rmult (to_real a) (to_real b)) (to_real c) in Rle (Rabs (Rminus (to_real (umul (umul a b) c)) exact)) (Rplus (Rmult (Rmult (Rplus 2%R eps) eps) (Rabs exact)) (Rmult eta (Rplus (Rmult (Rabs (to_real c)) (Rplus 1%R eps)) 1%R))).
Proof.
Admitted.
