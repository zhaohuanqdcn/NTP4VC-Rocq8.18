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
Definition sorted (a : list Z) (hi : Z) := ∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 ≤ j2 ∧ j2 < hi -> nth (Z.to_nat j2) a inhabitant ≤ nth (Z.to_nat j1) a inhabitant.
Theorem pancake_sort'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 2%Z in (0%Z ≤ o1 + 1%Z -> (sorted a 0%Z ∧ (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 < 0%Z ∧ 0%Z ≤ j2 ∧ j2 < Z.of_nat (length a) -> nth (Z.to_nat j2) a inhabitant ≤ nth (Z.to_nat j1) a inhabitant) ∧ a ≡ₚ a) ∧ (∀(a1 : list Z), length a1 = length a -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ sorted a1 i ∧ (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 < i ∧ i ≤ j2 ∧ j2 < Z.of_nat (length a1) -> nth (Z.to_nat j2) a1 inhabitant ≤ nth (Z.to_nat j1) a1 inhabitant) ∧ a ≡ₚ a1 -> (let o2 : Z := Z.of_nat (length a1) - 1%Z in let o3 : Z := i + 1%Z in (o3 ≤ o2 + 1%Z -> ((i ≤ i ∧ i < Z.of_nat (length a1)) ∧ (∀(j : Z), i ≤ j ∧ j < o3 -> nth (Z.to_nat j) a1 inhabitant ≤ nth (Z.to_nat i) a1 inhabitant)) ∧ (∀(m : Z), (∀(k : Z), (o3 ≤ k ∧ k ≤ o2) ∧ (i ≤ m ∧ m < Z.of_nat (length a1)) ∧ (∀(j : Z), i ≤ j ∧ j < k -> nth (Z.to_nat j) a1 inhabitant ≤ nth (Z.to_nat m) a1 inhabitant) -> (0%Z ≤ m ∧ m < Z.of_nat (length a1)) ∧ (0%Z ≤ k ∧ k < Z.of_nat (length a1)) ∧ (if decide (nth (Z.to_nat m) a1 inhabitant < nth (Z.to_nat k) a1 inhabitant) then (i ≤ k ∧ k < Z.of_nat (length a1)) ∧ (∀(j : Z), i ≤ j ∧ j < k + 1%Z -> nth (Z.to_nat j) a1 inhabitant ≤ nth (Z.to_nat k) a1 inhabitant) else (i ≤ m ∧ m < Z.of_nat (length a1)) ∧ (∀(j : Z), i ≤ j ∧ j < k + 1%Z -> nth (Z.to_nat j) a1 inhabitant ≤ nth (Z.to_nat m) a1 inhabitant))) ∧ ((i ≤ m ∧ m < Z.of_nat (length a1)) ∧ (∀(j : Z), i ≤ j ∧ j < o2 + 1%Z -> nth (Z.to_nat j) a1 inhabitant ≤ nth (Z.to_nat m) a1 inhabitant) -> (if decide (m = i) then sorted a1 (i + 1%Z) ∧ (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 < i + 1%Z ∧ i + 1%Z ≤ j2 ∧ j2 < Z.of_nat (length a1) -> nth (Z.to_nat j2) a1 inhabitant ≤ nth (Z.to_nat j1) a1 inhabitant) ∧ a ≡ₚ a1 else if decide (m < Z.of_nat (length a1) - 1%Z) then (0%Z ≤ m ∧ m < Z.of_nat (length a1)) ∧ (∀(a2 : list Z), length a2 = length a1 -> (∀(j : Z), 0%Z ≤ j ∧ j < m -> nth (Z.to_nat j) a2 inhabitant = nth (Z.to_nat j) a1 inhabitant) ∧ (∀(j : Z), m ≤ j ∧ j < Z.of_nat (length a2) -> nth (Z.to_nat j) a2 inhabitant = nth (Z.to_nat (Z.of_nat (length a2) - 1%Z - (j - m))) a1 inhabitant) ∧ a1 ≡ₚ a2 -> (0%Z ≤ i ∧ i < Z.of_nat (length a2)) ∧ (∀(a3 : list Z), length a3 = length a2 -> (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a3 inhabitant = nth (Z.to_nat j) a2 inhabitant) ∧ (∀(j : Z), i ≤ j ∧ j < Z.of_nat (length a3) -> nth (Z.to_nat j) a3 inhabitant = nth (Z.to_nat (Z.of_nat (length a3) - 1%Z - (j - i))) a2 inhabitant) ∧ a2 ≡ₚ a3 -> sorted a3 (i + 1%Z) ∧ (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 < i + 1%Z ∧ i + 1%Z ≤ j2 ∧ j2 < Z.of_nat (length a3) -> nth (Z.to_nat j2) a3 inhabitant ≤ nth (Z.to_nat j1) a3 inhabitant) ∧ a ≡ₚ a3)) else (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (∀(a2 : list Z), length a2 = length a1 -> (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a2 inhabitant = nth (Z.to_nat j) a1 inhabitant) ∧ (∀(j : Z), i ≤ j ∧ j < Z.of_nat (length a2) -> nth (Z.to_nat j) a2 inhabitant = nth (Z.to_nat (Z.of_nat (length a2) - 1%Z - (j - i))) a1 inhabitant) ∧ a1 ≡ₚ a2 -> sorted a2 (i + 1%Z) ∧ (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 < i + 1%Z ∧ i + 1%Z ≤ j2 ∧ j2 < Z.of_nat (length a2) -> nth (Z.to_nat j2) a2 inhabitant ≤ nth (Z.to_nat j1) a2 inhabitant) ∧ a ≡ₚ a2))))) ∧ (o2 + 1%Z < o3 -> sorted a1 (i + 1%Z) ∧ (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 < i + 1%Z ∧ i + 1%Z ≤ j2 ∧ j2 < Z.of_nat (length a1) -> nth (Z.to_nat j2) a1 inhabitant ≤ nth (Z.to_nat j1) a1 inhabitant) ∧ a ≡ₚ a1))) ∧ (sorted a1 (o1 + 1%Z) ∧ (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 < o1 + 1%Z ∧ o1 + 1%Z ≤ j2 ∧ j2 < Z.of_nat (length a1) -> nth (Z.to_nat j2) a1 inhabitant ≤ nth (Z.to_nat j1) a1 inhabitant) ∧ a ≡ₚ a1 -> sorted a1 (Z.of_nat (length a1)) ∧ a ≡ₚ a1))) ∧ (o1 + 1%Z < 0%Z -> sorted a (Z.of_nat (length a)) ∧ a ≡ₚ a).
Proof.
Admitted.
