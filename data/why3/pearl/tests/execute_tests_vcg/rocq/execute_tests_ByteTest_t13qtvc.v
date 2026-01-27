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
Theorem t13'vc : ¬ 2%Z = 0%Z ∧ uint'8_in_bounds (Z.rem 24%Z 2%Z) ∧ (∀(o1 : bv 8%N), bv_unsigned o1 = Z.rem 24%Z 2%Z -> uint'8_in_bounds (42%Z + bv_unsigned o1) ∧ (∀(z : bv 8%N), bv_unsigned z = 42%Z + bv_unsigned o1 -> uint'8_in_bounds (bv_unsigned z * 42%Z) ∧ (∀(w : bv 8%N), bv_unsigned w = bv_unsigned z * 42%Z -> ¬ 10%Z = 0%Z ∧ uint'8_in_bounds (Z.quot (bv_unsigned w) 10%Z)))).
Admitted.
