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
Require Import lse.my_sum.Sum.
Require Import lse.sum_real.Sum.
Require Import lse.udouble.UDouble.
Require Import Why3.ieee_float.RoundingMode.
Open Scope Z_scope.
Theorem u_sum_accuracy_combine'vc (a : Z) (b : Z) (f' : Z -> udouble) (f : Z -> R) (rel_err : R) (abs_err : R) (fact0 : ∀(i : Z), a ≤ i ∧ i < b -> Rle (Rabs (Rminus (real_fun f' i) (f i))) (Rplus (Rmult (Rabs (f i)) rel_err) abs_err)) (fact1 : Rle 0%R rel_err) (fact2 : Rle rel_err 1%R) (fact3 : Rle 0%R abs_err) (fact4 : Rle abs_err 1%R) (fact5 : 0%Z ≤ b - a) : Rle (Rabs (Rminus (to_real (u_sum f' a b)) (sum f a b))) (Rplus (Rmult (sum (abs_fun f) a b) (Rplus rel_err (Rmult (Rmult (Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992))) (Rdefinitions.IZR (b - a - 1%Z))) (Rplus 1%R rel_err)))) (Rmult abs_err (Rmult (Rplus 1%R (Rmult (Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992))) (Rdefinitions.IZR (b - a - 1%Z)))) (Rdefinitions.IZR (b - a))))).
Proof.
Admitted.
