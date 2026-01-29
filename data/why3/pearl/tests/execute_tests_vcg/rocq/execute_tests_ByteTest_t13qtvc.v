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
Open Scope Z_scope.
Theorem t13'vc : ¬ 2%Z = 0%Z ∧ uint'8_in_bounds (Z.rem 24%Z 2%Z) ∧ (∀(o1 : bv 8%N), bv_unsigned o1 = Z.rem 24%Z 2%Z -> uint'8_in_bounds (42%Z + bv_unsigned o1) ∧ (∀(z : bv 8%N), bv_unsigned z = 42%Z + bv_unsigned o1 -> uint'8_in_bounds (bv_unsigned z * 42%Z) ∧ (∀(w : bv 8%N), bv_unsigned w = bv_unsigned z * 42%Z -> ¬ 10%Z = 0%Z ∧ uint'8_in_bounds (Z.quot (bv_unsigned w) 10%Z)))).
Proof.
Admitted.
