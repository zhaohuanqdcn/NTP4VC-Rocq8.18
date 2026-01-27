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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Theorem partition'vc (m : Z) (n : Z) (a : list Z) (fact0 : 0%Z ≤ m) (fact1 : m < n) (fact2 : n < Z.of_nat (length a)) : 0%Z ≤ m ∧ m < n ∧ n < Z.of_nat (length a) ∧ (∀(o1 : Z) (j : Z) (i : Z) (a1 : list Z), length a1 = length a -> (m ≤ j ∧ j < i ∧ i ≤ n) ∧ permut_sub' a a1 (Z.to_nat m) (Z.to_nat (n + 1%Z)) ∧ (∀(r : Z), m ≤ r ∧ r ≤ j -> nth (Z.to_nat r) a1 inhabitant ≤ o1) ∧ (∀(r : Z), j < r ∧ r < i -> nth (Z.to_nat r) a1 inhabitant = o1) ∧ (∀(r : Z), i ≤ r ∧ r ≤ n -> o1 ≤ nth (Z.to_nat r) a1 inhabitant) -> (m ≤ j ∧ j < i ∧ i ≤ n) ∧ permut_sub' a a1 (Z.to_nat m) (Z.to_nat (n + 1%Z)) ∧ (∃(x : Z), (∀(r : Z), m ≤ r ∧ r ≤ j -> nth (Z.to_nat r) a1 inhabitant ≤ x) ∧ (∀(r : Z), j < r ∧ r < i -> nth (Z.to_nat r) a1 inhabitant = x) ∧ (∀(r : Z), i ≤ r ∧ r ≤ n -> x ≤ nth (Z.to_nat r) a1 inhabitant))).
Admitted.
