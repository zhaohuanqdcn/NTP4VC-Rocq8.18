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
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom zero : t.
Axiom infix_pl : t -> t -> t.
Axiom prefix_mn : t -> t.
Axiom infix_as : t -> t -> t.
Axiom Assoc : forall  (x : t) (y : t) (z : t), infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z).
Axiom Unit_def_l : forall  (x : t), infix_pl zero x = x.
Axiom Unit_def_r : forall  (x : t), infix_pl x zero = x.
Axiom Inv_def_l : forall  (x : t), infix_pl (prefix_mn x) x = zero.
Axiom Inv_def_r : forall  (x : t), infix_pl x (prefix_mn x) = zero.
Axiom Comm : forall  (x : t) (y : t), infix_pl x y = infix_pl y x.
Axiom Assoc1 : forall  (x : t) (y : t) (z : t), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Mul_distr_l : forall  (x : t) (y : t) (z : t), infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z).
Axiom Mul_distr_r : forall  (y : t) (z : t) (x : t), infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x).
Axiom mul : t -> Z -> t.
Axiom mul'def : forall  (n : Z) (x : t) (fact0 : 0%Z ≤ n), if decide (n = 0%Z) then mul x n = zero else mul x n = infix_pl x (mul x (n - 1%Z)).
Axiom Assoc2 : forall  (x : t) (y : t) (z : t), infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z).
Axiom Unit_def_l1 : forall  (x : t), infix_pl zero x = x.
Axiom Unit_def_r1 : forall  (x : t), infix_pl x zero = x.
Axiom Power_0 : forall  (x : t), mul x 0%Z = zero.
Axiom Power_s : forall  (n : Z) (x : t) (fact0 : 0%Z ≤ n), mul x (n + 1%Z) = infix_pl x (mul x n).
Axiom Power_s_alt : forall  (n : Z) (x : t) (fact0 : 0%Z < n), mul x n = infix_pl x (mul x (n - 1%Z)).
Axiom Power_1 : forall  (x : t), mul x 1%Z = x.
Axiom Power_sum : forall  (n : Z) (m : Z) (x : t) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), mul x (n + m) = infix_pl (mul x n) (mul x m).
Axiom Power_mult : forall  (n : Z) (m : Z) (x : t) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), mul x (n * m) = mul (mul x n) m.
Axiom Power_comm1 : forall  (x : t) (y : t) (n : Z) (fact0 : infix_pl x y = infix_pl y x) (fact1 : 0%Z ≤ n), infix_pl (mul x n) y = infix_pl y (mul x n).
Axiom Power_comm2 : forall  (x : t) (y : t) (n : Z) (fact0 : infix_pl x y = infix_pl y x) (fact1 : 0%Z ≤ n), mul (infix_pl x y) n = infix_pl (mul x n) (mul y n).
Definition null (x : t) (n : Z) := mul x n = zero.
Theorem null_star_r'vc (n : Z) (y : t) (x : t) (fact0 : 0%Z ≤ n) (fact1 : null y n) : null (infix_as x y) n.
Admitted.
