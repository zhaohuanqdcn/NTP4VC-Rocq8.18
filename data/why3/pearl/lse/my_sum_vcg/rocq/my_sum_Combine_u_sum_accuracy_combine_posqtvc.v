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
Require Import lse.my_sum.Sum.
Require Import lse.sum_real.Sum.
Require Import lse.udouble.UDouble.
Require Import Why3.ieee_float.RoundingMode.
Open Scope Z_scope.
Theorem u_sum_accuracy_combine_pos'vc (a : Z) (b : Z) (f' : Z -> udouble) (f : Z -> R) (rel_err : R) (abs_err : R) (fact0 : ∀(i : Z), a ≤ i ∧ i < b -> Rle (Rabs (Rminus (real_fun f' i) (f i))) (Rplus (Rmult (Rabs (f i)) rel_err) abs_err)) (fact1 : ∀(i : Z), a ≤ i ∧ i < b -> Rle 0%R (f i)) (fact2 : Rle 0%R rel_err) (fact3 : Rle rel_err 1%R) (fact4 : Rle 0%R abs_err) (fact5 : Rle abs_err 1%R) (fact6 : 0%Z ≤ b - a) : Rle (Rabs (Rminus (to_real (u_sum f' a b)) (sum f a b))) (Rplus (Rmult (sum f a b) (Rplus rel_err (Rmult (Rmult (Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992))) (Rdefinitions.IZR (b - a - 1%Z))) (Rplus 1%R rel_err)))) (Rmult abs_err (Rmult (Rplus 1%R (Rmult (Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992))) (Rdefinitions.IZR (b - a - 1%Z)))) (Rdefinitions.IZR (b - a))))).
Admitted.
