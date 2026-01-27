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
Theorem euclid'vc (u : Z) (v : Z) (fact0 : 0%Z ≤ u) (fact1 : 0%Z ≤ v) : (¬ v = 0%Z -> ¬ v = 0%Z ∧ (let o1 : Z := Z.quot u v in (0%Z ≤ v ∧ o1 < v) ∧ 0%Z ≤ v ∧ 0%Z ≤ o1)) ∧ (∀(result : Z), (if decide (v = 0%Z) then result = u else result = Z.gcd v (Z.quot u v)) -> result = Z.gcd u v).
Admitted.
