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
Theorem multiplication_errors'vc (d : udouble) (e : udouble) (f : udouble) (a : udouble) (b : udouble) (c : udouble) : let t : R := Rplus 1%R eps in let t3 : R := Rplus eps (Rmult eps t) in let t4 : R := Rmult (to_real d) (Rmult (to_real e) (to_real f)) in let t5 : R := Rmult (Rmult (to_real a) (to_real b)) (to_real c) in let t6 : R := Rplus (Rmult (Rmult eta (Rabs (to_real d))) t) eta in let t7 : R := Rplus (Rmult (Rmult eta (Rabs (to_real c))) t) eta in let exact : R := Rmult t5 t4 in Rle (Rabs (Rminus (to_real (umul (umul (umul a b) c) (umul d (umul e f)))) exact)) (Rplus (Rplus (Rmult (Rplus eps (Rmult (Rplus (Rplus t3 t3) (Rmult t3 t3)) t)) (Rabs exact)) (Rmult (Rplus (Rplus (Rmult (Rplus t6 (Rmult t6 t3)) (Rabs t5)) (Rmult (Rplus t7 (Rmult t7 t3)) (Rabs t4))) (Rmult t7 t6)) t)) eta).
Proof.
Admitted.
