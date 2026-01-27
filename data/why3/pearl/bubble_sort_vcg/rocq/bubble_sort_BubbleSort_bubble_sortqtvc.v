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
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Theorem bubble_sort'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in (1%Z - 1%Z ≤ o1 -> (a ≡ₚ a ∧ sorted_sub1 a o1 (Z.of_nat (length a)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ o1 ∧ o1 < k2 ∧ k2 < Z.of_nat (length a) -> nth (Z.to_nat k1) a inhabitant ≤ nth (Z.to_nat k2) a inhabitant)) ∧ (∀(a1 : list Z), length a1 = length a -> (∀(i : Z), (i ≤ o1 ∧ 1%Z ≤ i) ∧ a ≡ₚ a1 ∧ sorted_sub1 a1 i (Z.of_nat (length a1)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ i ∧ i < k2 ∧ k2 < Z.of_nat (length a1) -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant) -> (let o2 : Z := i - 1%Z in (0%Z ≤ o2 + 1%Z -> (a ≡ₚ a1 ∧ sorted_sub1 a1 i (Z.of_nat (length a1)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ i ∧ i < k2 ∧ k2 < Z.of_nat (length a1) -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant) ∧ (∀(k : Z), 0%Z ≤ k ∧ k ≤ 0%Z -> nth (Z.to_nat k) a1 inhabitant ≤ nth 0%nat a1 inhabitant)) ∧ (∀(a2 : list Z), length a2 = length a1 -> (∀(j : Z), (0%Z ≤ j ∧ j ≤ o2) ∧ a ≡ₚ a2 ∧ sorted_sub1 a2 i (Z.of_nat (length a2)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ i ∧ i < k2 ∧ k2 < Z.of_nat (length a2) -> nth (Z.to_nat k1) a2 inhabitant ≤ nth (Z.to_nat k2) a2 inhabitant) ∧ (∀(k : Z), 0%Z ≤ k ∧ k ≤ j -> nth (Z.to_nat k) a2 inhabitant ≤ nth (Z.to_nat j) a2 inhabitant) -> (let o3 : Z := j + 1%Z in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length a2)) ∧ (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (if decide (nth (Z.to_nat o3) a2 inhabitant < nth (Z.to_nat j) a2 inhabitant) then let o4 : Z := j + 1%Z in ((0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ 0%Z ≤ o4 ∧ o4 < Z.of_nat (length a2)) ∧ (∀(a3 : list Z), length a3 = length a2 -> array_exchange a2 a3 j o4 -> a ≡ₚ a3 ∧ sorted_sub1 a3 i (Z.of_nat (length a3)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ i ∧ i < k2 ∧ k2 < Z.of_nat (length a3) -> nth (Z.to_nat k1) a3 inhabitant ≤ nth (Z.to_nat k2) a3 inhabitant) ∧ (∀(k : Z), 0%Z ≤ k ∧ k ≤ j + 1%Z -> nth (Z.to_nat k) a3 inhabitant ≤ nth (Z.to_nat (j + 1%Z)) a3 inhabitant)) else a ≡ₚ a2 ∧ sorted_sub1 a2 i (Z.of_nat (length a2)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ i ∧ i < k2 ∧ k2 < Z.of_nat (length a2) -> nth (Z.to_nat k1) a2 inhabitant ≤ nth (Z.to_nat k2) a2 inhabitant) ∧ (∀(k : Z), 0%Z ≤ k ∧ k ≤ j + 1%Z -> nth (Z.to_nat k) a2 inhabitant ≤ nth (Z.to_nat (j + 1%Z)) a2 inhabitant)))) ∧ (a ≡ₚ a2 ∧ sorted_sub1 a2 i (Z.of_nat (length a2)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ i ∧ i < k2 ∧ k2 < Z.of_nat (length a2) -> nth (Z.to_nat k1) a2 inhabitant ≤ nth (Z.to_nat k2) a2 inhabitant) ∧ (∀(k : Z), 0%Z ≤ k ∧ k ≤ o2 + 1%Z -> nth (Z.to_nat k) a2 inhabitant ≤ nth (Z.to_nat (o2 + 1%Z)) a2 inhabitant) -> a ≡ₚ a2 ∧ sorted_sub1 a2 (i - 1%Z) (Z.of_nat (length a2)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ i - 1%Z ∧ i - 1%Z < k2 ∧ k2 < Z.of_nat (length a2) -> nth (Z.to_nat k1) a2 inhabitant ≤ nth (Z.to_nat k2) a2 inhabitant)))) ∧ (o2 + 1%Z < 0%Z -> a ≡ₚ a1 ∧ sorted_sub1 a1 (i - 1%Z) (Z.of_nat (length a1)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ i - 1%Z ∧ i - 1%Z < k2 ∧ k2 < Z.of_nat (length a1) -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant)))) ∧ (a ≡ₚ a1 ∧ sorted_sub1 a1 (1%Z - 1%Z) (Z.of_nat (length a1)) ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ 1%Z - 1%Z ∧ 1%Z - 1%Z < k2 ∧ k2 < Z.of_nat (length a1) -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant) -> a ≡ₚ a1 ∧ sorted a1))) ∧ (o1 < 1%Z - 1%Z -> a ≡ₚ a ∧ sorted a).
Admitted.
