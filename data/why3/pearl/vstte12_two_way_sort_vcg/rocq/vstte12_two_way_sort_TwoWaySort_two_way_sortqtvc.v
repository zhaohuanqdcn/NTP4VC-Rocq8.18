From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Definition le (x : bool) (y : bool) := x = false ∨ y = true.
Definition sorted (a : list bool) := ∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 ≤ i2 ∧ i2 < Z.of_nat (length a) -> le (nth (Z.to_nat i1) a inhabitant) (nth (Z.to_nat i2) a inhabitant).
Theorem two_way_sort'vc (a : list bool) : let o1 : Z := Z.of_nat (length a) - 1%Z in ((0%Z ≤ 0%Z ∧ o1 < Z.of_nat (length a)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < 0%Z -> nth (Z.to_nat k) a inhabitant = false) ∧ (∀(k : Z), o1 < k ∧ k < Z.of_nat (length a) -> nth (Z.to_nat k) a inhabitant = true) ∧ a ≡ₚ a) ∧ (∀(j : Z) (i : Z) (a1 : list bool), length a1 = length a -> (0%Z ≤ i ∧ j < Z.of_nat (length a1)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i -> nth (Z.to_nat k) a1 inhabitant = false) ∧ (∀(k : Z), j < k ∧ k < Z.of_nat (length a1) -> nth (Z.to_nat k) a1 inhabitant = true) ∧ a ≡ₚ a1 -> (if decide (i < j) then (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (if decide (¬ nth (Z.to_nat i) a1 inhabitant = true) then (0%Z ≤ j - i ∧ j - (i + 1%Z) < j - i) ∧ (0%Z ≤ i + 1%Z ∧ j < Z.of_nat (length a1)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i + 1%Z -> nth (Z.to_nat k) a1 inhabitant = false) ∧ (∀(k : Z), j < k ∧ k < Z.of_nat (length a1) -> nth (Z.to_nat k) a1 inhabitant = true) ∧ a ≡ₚ a1 else (0%Z ≤ j ∧ j < Z.of_nat (length a1)) ∧ (if decide (nth (Z.to_nat j) a1 inhabitant = true) then (0%Z ≤ j - i ∧ j - 1%Z - i < j - i) ∧ (0%Z ≤ i ∧ j - 1%Z < Z.of_nat (length a1)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i -> nth (Z.to_nat k) a1 inhabitant = false) ∧ (∀(k : Z), j - 1%Z < k ∧ k < Z.of_nat (length a1) -> nth (Z.to_nat k) a1 inhabitant = true) ∧ a ≡ₚ a1 else ((0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ 0%Z ≤ j ∧ j < Z.of_nat (length a1)) ∧ (∀(a2 : list bool), length a2 = length a1 -> array_exchange a1 a2 i j -> (0%Z ≤ j - i ∧ j - 1%Z - (i + 1%Z) < j - i) ∧ (0%Z ≤ i + 1%Z ∧ j - 1%Z < Z.of_nat (length a2)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i + 1%Z -> nth (Z.to_nat k) a2 inhabitant = false) ∧ (∀(k : Z), j - 1%Z < k ∧ k < Z.of_nat (length a2) -> nth (Z.to_nat k) a2 inhabitant = true) ∧ a ≡ₚ a2))) else sorted a1 ∧ a ≡ₚ a1)).
Proof.
Admitted.
