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
Theorem sum'vc (i : Z) (j : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i ≤ j) (fact2 : j ≤ Z.of_nat (length a)) (fact3 : ¬ j ≤ i) : let o1 : Z := i + 1%Z in ((0%Z ≤ j - i ∧ j - o1 < j - i) ∧ 0%Z ≤ o1 ∧ o1 ≤ j ∧ j ≤ Z.of_nat (length a)) ∧ 0%Z ≤ i ∧ i < Z.of_nat (length a).
Admitted.
