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
Theorem u_sum_constant_bounds'vc (n : Z) (m : Z) (size : Z) (max : R) (a : Z -> udouble) (fact0 : 0%Z ≤ n - m) (fact1 : n - m ≤ size) (fact2 : Rle 0%R max) (fact3 : ∀(i : Z), m ≤ i ∧ i < n -> Rle (Rabs (to_real (a i))) max) : let o1 : Z -> R := real_fun a in let o2 : R := Ropp max in (m ≤ n ∧ (∀(i : Z), m ≤ i ∧ i < n -> Rle o2 (o1 i) ∧ Rle (o1 i) max)) ∧ (Rle (Rmult (Rdefinitions.IZR (n - m)) o2) (sum o1 m n) ∧ Rle (sum o1 m n) (Rmult (Rdefinitions.IZR (n - m)) max) -> (let o3 : Z -> R := abs_real_fun a in (m ≤ n ∧ (∀(i : Z), m ≤ i ∧ i < n -> Rle 0%R (o3 i) ∧ Rle (o3 i) max)) ∧ (Rle (Rmult (Rdefinitions.IZR (n - m)) 0%R) (sum o3 m n) ∧ Rle (sum o3 m n) (Rmult (Rdefinitions.IZR (n - m)) max) -> Rle (Rabs (to_real (u_sum a m n))) (Rmult (Rmult max (Rdefinitions.IZR size)) (Rplus 1%R (Rmult (Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992))) (Rdefinitions.IZR (size - 1%Z)))))))).
Proof.
Admitted.
