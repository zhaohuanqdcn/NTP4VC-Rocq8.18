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
Definition sorted_sub (a : Z -> Z) (l : Z) (u : Z) := ∀(i1 : Z) (i2 : Z), l ≤ i1 ∧ i1 ≤ i2 ∧ i2 < u -> a i1 ≤ a i2.
Definition sorted_sub1 (a : list Z) (l : Z) (u : Z) := sorted_sub (nth_i a) l u.
Definition sorted (a : list Z) := sorted_sub (nth_i a) 0%Z (Z.of_nat (length a)).
