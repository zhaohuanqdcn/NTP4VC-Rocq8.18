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
Theorem selection_sort'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> (sorted_sub1 a 0%Z 0%Z ∧ a ≡ₚ a ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 < 0%Z ∧ 0%Z ≤ k2 ∧ k2 < Z.of_nat (length a) -> nth (Z.to_nat k1) a inhabitant ≤ nth (Z.to_nat k2) a inhabitant)) ∧ (∀(a1 : list Z), length a1 = length a -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ sorted_sub1 a1 0%Z i ∧ a ≡ₚ a1 ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 < i ∧ i ≤ k2 ∧ k2 < Z.of_nat (length a1) -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant) -> (let o2 : Z := Z.of_nat (length a1) - 1%Z in let o3 : Z := i + 1%Z in (o3 ≤ o2 + 1%Z -> ((i ≤ i ∧ i < o3) ∧ (∀(k : Z), i ≤ k ∧ k < o3 -> nth (Z.to_nat i) a1 inhabitant ≤ nth (Z.to_nat k) a1 inhabitant)) ∧ (∀(min : Z), (∀(j : Z), (o3 ≤ j ∧ j ≤ o2) ∧ (i ≤ min ∧ min < j) ∧ (∀(k : Z), i ≤ k ∧ k < j -> nth (Z.to_nat min) a1 inhabitant ≤ nth (Z.to_nat k) a1 inhabitant) -> (0%Z ≤ min ∧ min < Z.of_nat (length a1)) ∧ (0%Z ≤ j ∧ j < Z.of_nat (length a1)) ∧ (if decide (nth (Z.to_nat j) a1 inhabitant < nth (Z.to_nat min) a1 inhabitant) then (i ≤ j ∧ j < j + 1%Z) ∧ (∀(k : Z), i ≤ k ∧ k < j + 1%Z -> nth (Z.to_nat j) a1 inhabitant ≤ nth (Z.to_nat k) a1 inhabitant) else (i ≤ min ∧ min < j + 1%Z) ∧ (∀(k : Z), i ≤ k ∧ k < j + 1%Z -> nth (Z.to_nat min) a1 inhabitant ≤ nth (Z.to_nat k) a1 inhabitant))) ∧ ((i ≤ min ∧ min < o2 + 1%Z) ∧ (∀(k : Z), i ≤ k ∧ k < o2 + 1%Z -> nth (Z.to_nat min) a1 inhabitant ≤ nth (Z.to_nat k) a1 inhabitant) -> (if decide (¬ min = i) then ((0%Z ≤ min ∧ min < Z.of_nat (length a1)) ∧ 0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (∀(a2 : list Z), length a2 = length a1 -> array_exchange a1 a2 min i -> sorted_sub1 a2 0%Z (i + 1%Z) ∧ a ≡ₚ a2 ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 < i + 1%Z ∧ i + 1%Z ≤ k2 ∧ k2 < Z.of_nat (length a2) -> nth (Z.to_nat k1) a2 inhabitant ≤ nth (Z.to_nat k2) a2 inhabitant)) else sorted_sub1 a1 0%Z (i + 1%Z) ∧ a ≡ₚ a1 ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 < i + 1%Z ∧ i + 1%Z ≤ k2 ∧ k2 < Z.of_nat (length a1) -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant))))) ∧ (o2 + 1%Z < o3 -> (if decide (¬ True) then ((0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ 0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (∀(a2 : list Z), length a2 = length a1 -> array_exchange a1 a2 i i -> sorted_sub1 a2 0%Z (i + 1%Z) ∧ a ≡ₚ a2 ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 < i + 1%Z ∧ i + 1%Z ≤ k2 ∧ k2 < Z.of_nat (length a2) -> nth (Z.to_nat k1) a2 inhabitant ≤ nth (Z.to_nat k2) a2 inhabitant)) else sorted_sub1 a1 0%Z (i + 1%Z) ∧ a ≡ₚ a1 ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 < i + 1%Z ∧ i + 1%Z ≤ k2 ∧ k2 < Z.of_nat (length a1) -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant))))) ∧ (sorted_sub1 a1 0%Z (o1 + 1%Z) ∧ a ≡ₚ a1 ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 < o1 + 1%Z ∧ o1 + 1%Z ≤ k2 ∧ k2 < Z.of_nat (length a1) -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant) -> sorted a1 ∧ a ≡ₚ a1))) ∧ (o1 + 1%Z < 0%Z -> sorted a ∧ a ≡ₚ a).
Admitted.
