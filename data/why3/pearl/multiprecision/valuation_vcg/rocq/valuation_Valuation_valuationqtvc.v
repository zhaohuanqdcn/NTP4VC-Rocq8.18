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
Theorem valuation'vc (p : Z) (n : Z) (fact0 : 1%Z < p) (fact1 : 1%Z ≤ n) : ¬ p = 0%Z ∧ (let o1 : Z := Z.quot n p in (o1 = 0%Z -> ¬ p = 0%Z ∧ (let d : Z := Z.rem n p in (0%Z ≤ n ∧ d < n) ∧ 1%Z < p ∧ 1%Z ≤ d)) ∧ (∀(result : Z), (if decide (o1 = 0%Z) then ∃(r : Z), (0%Z ≤ r ∧ (Z.pow p r | Z.rem n p)) ∧ result = r + 1%Z else result = 0%Z) -> 0%Z ≤ result ∧ (Z.pow p result | n))).
Admitted.
