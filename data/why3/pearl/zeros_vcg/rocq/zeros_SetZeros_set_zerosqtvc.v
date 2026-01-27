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
Theorem set_zeros'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> nth (Z.to_nat j) a inhabitant = 0%Z) ∧ (∀(a1 : list Z), length a1 = length a -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a1 inhabitant = 0%Z) -> (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (length (set_list a1 (Z.to_nat i) 0%Z) = length a1 -> nth_i (set_list a1 (Z.to_nat i) 0%Z) = fun_updt (nth_i a1) i 0%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat j) (set_list a1 (Z.to_nat i) 0%Z) inhabitant = 0%Z))) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < o1 + 1%Z -> nth (Z.to_nat j) a1 inhabitant = 0%Z) -> (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length a1) -> nth (Z.to_nat j) a1 inhabitant = 0%Z)))) ∧ (o1 + 1%Z < 0%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat j) a inhabitant = 0%Z)).
Admitted.
