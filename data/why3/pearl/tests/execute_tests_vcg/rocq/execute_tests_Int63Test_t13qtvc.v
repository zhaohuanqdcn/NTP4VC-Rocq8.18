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
Theorem t13'vc : ¬ 2%Z = 0%Z ∧ int'63_in_bounds (Z.rem 24%Z 2%Z) ∧ (∀(o1 : bv 63%N), bv_signed o1 = Z.rem 24%Z 2%Z -> int'63_in_bounds (42%Z + bv_signed o1) ∧ (∀(z : bv 63%N), bv_signed z = 42%Z + bv_signed o1 -> int'63_in_bounds (bv_signed z * 42%Z) ∧ (∀(w : bv 63%N), bv_signed w = bv_signed z * 42%Z -> (¬ 10%Z = 0%Z ∧ int'63_in_bounds (Z.quot (bv_signed w) 10%Z)) ∧ (∀(w1 : bv 63%N), bv_signed w1 = Z.quot (bv_signed w) 10%Z -> int'63_in_bounds (- bv_signed w1))))).
Admitted.
