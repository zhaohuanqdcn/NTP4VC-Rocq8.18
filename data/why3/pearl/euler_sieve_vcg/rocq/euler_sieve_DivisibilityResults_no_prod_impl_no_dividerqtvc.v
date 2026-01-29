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
Theorem no_prod_impl_no_divider'vc (n : Z) (i : Z) (fact0 : 0%Z ≤ n) (fact1 : 2%Z ≤ i) (fact2 : i < n * n) (fact3 : ¬ (∃(k : Z) (l : Z), (2%Z ≤ k ∧ k < n) ∧ (2%Z ≤ l ∧ l < i) ∧ k * l = i)) : ¬ (∃(k : Z), (2%Z ≤ k ∧ k < n) ∧ ¬ k = i ∧ (k | i)).
Proof.
Admitted.
