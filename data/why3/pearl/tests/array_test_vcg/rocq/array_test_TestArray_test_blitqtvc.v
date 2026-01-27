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
Theorem test_blit'vc : 0%Z ≤ 17%Z ∧ (∀(a1 : list bool), (∀(i : Z), 0%Z ≤ i ∧ i < 17%Z -> nth (Z.to_nat i) a1 inhabitant = true) ∧ Z.of_nat (length a1) = 17%Z -> 0%Z ≤ 25%Z ∧ (∀(a2 : list bool), (∀(i : Z), 0%Z ≤ i ∧ i < 25%Z -> nth (Z.to_nat i) a2 inhabitant = false) ∧ Z.of_nat (length a2) = 25%Z -> (0%Z ≤ 10%Z ∧ 0%Z ≤ 7%Z ∧ 10%Z + 7%Z ≤ Z.of_nat (length a1)) ∧ 0%Z ≤ 17%Z ∧ 17%Z + 7%Z ≤ Z.of_nat (length a2))).
Admitted.
