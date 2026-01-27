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
Require Import Why3.int.Sum.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Theorem array_max'vc (a : list Z) : if decide (Z.of_nat (length a) = 0%Z) then ∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat j) a inhabitant ≤ 0%Z else (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ ((0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> nth (Z.to_nat j) a inhabitant ≤ nth 0%nat a inhabitant)) ∧ (∀(i : Z) (m : Z), (0%Z ≤ i ∧ i ≤ Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a inhabitant ≤ m) -> (if decide (i < Z.of_nat (length a)) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (m < nth (Z.to_nat i) a inhabitant) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ Z.of_nat (length a) - i ∧ Z.of_nat (length a) - (i + 1%Z) < Z.of_nat (length a) - i) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat j) a inhabitant ≤ nth (Z.to_nat i) a inhabitant) else (0%Z ≤ Z.of_nat (length a) - i ∧ Z.of_nat (length a) - (i + 1%Z) < Z.of_nat (length a) - i) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat j) a inhabitant ≤ m)) else ∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat j) a inhabitant ≤ m)).
Admitted.
