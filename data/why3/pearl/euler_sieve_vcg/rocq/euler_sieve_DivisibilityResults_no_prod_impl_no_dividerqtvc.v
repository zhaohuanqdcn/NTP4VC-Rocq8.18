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
Theorem no_prod_impl_no_divider'vc (n : Z) (i : Z) (fact0 : 0%Z ≤ n) (fact1 : 2%Z ≤ i) (fact2 : i < n * n) (fact3 : ¬ (∃(k : Z) (l : Z), (2%Z ≤ k ∧ k < n) ∧ (2%Z ≤ l ∧ l < i) ∧ k * l = i)) : ¬ (∃(k : Z), (2%Z ≤ k ∧ k < n) ∧ ¬ k = i ∧ (k | i)).
Admitted.
