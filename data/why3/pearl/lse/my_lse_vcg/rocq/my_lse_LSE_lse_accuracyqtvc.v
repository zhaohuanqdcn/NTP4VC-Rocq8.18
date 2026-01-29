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
Require Import lse.udouble.UDouble.
Require Import Why3.ieee_float.RoundingMode.
Require Import lse.my_exp_log.ExpLogLemmas.
Require Import lse.my_exp_log.ExpLogApprox.
Require Import lse.sum_real.Sum.
Require Import lse.my_sum.Sum.
Require Import lse.my_sum.Bound.
Require Import lse.my_sum.Combine.
Open Scope Z_scope.
Axiom exp_fun : (Z -> udouble) -> Z -> R.
Axiom exp_fun'def : forall  (a : Z -> udouble) (i : Z), exp_fun a i = exp (real_fun a i).
Axiom u_exp_fun : (Z -> udouble) -> Z -> udouble.
Axiom u_exp_fun'def : forall  (a : Z -> udouble) (i : Z), u_exp_fun a i = u_exp (a i).
Definition u_sum_of_u_exp (a : Z -> udouble) (m : Z) (n : Z) : udouble := u_sum (u_exp_fun a) m n.
Definition lse_exact (f : Z -> udouble) (size : Z) : R := ln (sum (exp_fun f) 0%Z size).
Theorem lse_accuracy'vc (size : Z) (a : Z -> udouble) (fact0 : 1%Z ≤ size) (fact1 : Rle (Rdefinitions.IZR (size - 1%Z)) 2251799813685248%R) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i < size -> Rle (Rabs (to_real (a i))) exp_max_value) (fact3 : Rle (Rmult (Rmult (Rmult (exp exp_max_value) (Rplus 1%R exp_error)) (Rdefinitions.IZR size)) (Rplus 1%R (Rmult (Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992))) (Rdefinitions.IZR (size - 1%Z))))) log_max_value) : Rle (Rabs (Rminus (to_real (u_log (u_sum_of_u_exp a 0%Z size))) (lse_exact a size))) (Rminus (Rmult log_error (Rabs (lse_exact a size))) (Rmult (ln (Rminus 1%R (Rplus exp_error (Rmult (Rmult (Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992))) (Rdefinitions.IZR (size - 1%Z))) (Rplus 1%R exp_error))))) (Rplus 1%R log_error))).
Proof.
Admitted.
