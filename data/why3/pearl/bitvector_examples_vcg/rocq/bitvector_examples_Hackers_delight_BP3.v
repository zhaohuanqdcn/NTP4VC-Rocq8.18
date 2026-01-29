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
Require Import Why3.why3.WellFounded.WellFounded.
Open Scope Z_scope.
Theorem BP3 (a : bv 32%N) (x : bv 32%N) (b : bv 32%N) (c : bv 32%N) (y : bv 32%N) (d : bv 32%N) (fact0 : bv_ule a x) (fact1 : bv_ule x b) (fact2 : bv_ule c y) (fact3 : bv_ule y d) : bv_ule (bv_not b) (bv_not x) ∧ bv_ule (bv_not x) (bv_not a).
Proof.
Admitted.
