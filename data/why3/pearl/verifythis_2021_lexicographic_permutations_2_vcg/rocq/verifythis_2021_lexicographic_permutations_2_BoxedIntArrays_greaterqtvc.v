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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Definition boxed (u : Z) (a : list Z) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 2%Z * Z.abs (nth (Z.to_nat i) a inhabitant) < u.
Theorem greater'vc (a : list Z) : (∀(a : list Z) (l : Z), 0%Z ≤ l ∧ l ≤ Z.of_nat (length a) -> (let o1 : Z := Z.of_nat (length a) in (¬ l = o1 -> (let o2 : Z := l + 1%Z in ((0%Z ≤ Z.of_nat (length a) - l ∧ Z.of_nat (length a) - o2 < Z.of_nat (length a) - l) ∧ 0%Z ≤ o2 ∧ o2 ≤ Z.of_nat (length a)) ∧ (∀(r : Z), 0%Z ≤ r ∧ (∀(i : Z), o2 ≤ i ∧ i < Z.of_nat (length a) -> 2%Z * Z.abs (nth (Z.to_nat i) a inhabitant) < r) -> 0%Z ≤ l ∧ l < Z.of_nat (length a)))) ∧ (∀(result : Z), (if decide (l = o1) then result = 0%Z else ∃(r : Z), (0%Z ≤ r ∧ (∀(i : Z), l + 1%Z ≤ i ∧ i < Z.of_nat (length a) -> 2%Z * Z.abs (nth (Z.to_nat i) a inhabitant) < r)) ∧ result = Z.max r (2%Z * Z.abs (nth (Z.to_nat l) a inhabitant) + 1%Z)) -> 0%Z ≤ result ∧ (∀(i : Z), l ≤ i ∧ i < Z.of_nat (length a) -> 2%Z * Z.abs (nth (Z.to_nat i) a inhabitant) < result)))) ∧ (∀(great : list Z -> Z -> Z), (∀(a : list Z) (l : Z), 0%Z ≤ l ∧ l ≤ Z.of_nat (length a) -> great a l = (if decide (l = Z.of_nat (length a)) then 0%Z else Z.max (great a (l + 1%Z)) (2%Z * Z.abs (nth (Z.to_nat l) a inhabitant) + 1%Z)) ∧ 0%Z ≤ great a l ∧ (∀(i : Z), l ≤ i ∧ i < Z.of_nat (length a) -> 2%Z * Z.abs (nth (Z.to_nat i) a inhabitant) < great a l)) -> 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)).
Admitted.
