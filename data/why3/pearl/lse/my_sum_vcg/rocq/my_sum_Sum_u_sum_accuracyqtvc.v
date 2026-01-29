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
Require Import lse.sum_real.Sum.
Require Import lse.udouble.UDouble.
Require Import Why3.ieee_float.RoundingMode.
Open Scope Z_scope.
Axiom u_sum : (Z -> udouble) -> Z -> Z -> udouble.
Axiom u_sum'def : forall  (n : Z) (m : Z) (a : Z -> udouble), if decide (n ≤ m) then u_sum a m n = uzero else u_sum a m n = uadd (u_sum a m (n - 1%Z)) (a (n - 1%Z)).
Axiom real_fun : (Z -> udouble) -> Z -> R.
Axiom real_fun'def : forall  (a : Z -> udouble) (i : Z), real_fun a i = to_real (a i).
Axiom abs_real_fun : (Z -> udouble) -> Z -> R.
Axiom abs_real_fun'def : forall  (a : Z -> udouble) (i : Z), abs_real_fun a i = Rabs (to_real (a i)).
Theorem u_sum_accuracy'vc (m : Z) (n : Z) (a : Z -> udouble) (fact0 : m ≤ n) : Rle (Rabs (Rminus (to_real (u_sum a m n)) (sum (real_fun a) m n))) (Rmult (Rmult (Rdefinitions.IZR (n - m - 1%Z)) (Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992)))) (sum (abs_real_fun a) m n)).
Proof.
Admitted.
