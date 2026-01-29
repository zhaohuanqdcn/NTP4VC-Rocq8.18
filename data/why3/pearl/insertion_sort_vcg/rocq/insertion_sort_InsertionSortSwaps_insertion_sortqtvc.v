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
Theorem insertion_sort'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in (1%Z ≤ o1 + 1%Z -> ((∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q < 1%Z -> nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat q) a inhabitant) ∧ a ≡ₚ a) ∧ (∀(a1 : list Z), length a1 = length a -> (∀(i : Z), (1%Z ≤ i ∧ i ≤ o1) ∧ (∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q < i -> nth (Z.to_nat p) a1 inhabitant ≤ nth (Z.to_nat q) a1 inhabitant) ∧ a ≡ₚ a1 -> ((0%Z ≤ i ∧ i ≤ i) ∧ a ≡ₚ a1 ∧ (∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q ≤ i -> ¬ q = i -> nth (Z.to_nat p) a1 inhabitant ≤ nth (Z.to_nat q) a1 inhabitant)) ∧ (∀(j : Z) (a2 : list Z), length a2 = length a1 -> (0%Z ≤ j ∧ j ≤ i) ∧ a ≡ₚ a2 ∧ (∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q ≤ i -> ¬ q = j -> nth (Z.to_nat p) a2 inhabitant ≤ nth (Z.to_nat q) a2 inhabitant) -> (0%Z < j -> (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (let o2 : Z := j - 1%Z in 0%Z ≤ o2 ∧ o2 < Z.of_nat (length a2))) ∧ (∀(o2 : bool), (if decide (0%Z < j) then o2 = (if decide (nth (Z.to_nat j) a2 inhabitant < nth (Z.to_nat (j - 1%Z)) a2 inhabitant) then true else false) else o2 = false) -> (if decide (o2 = true) then let o3 : Z := j - 1%Z in ((0%Z ≤ o3 ∧ o3 < Z.of_nat (length a2)) ∧ 0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (∀(a3 : list Z), length a3 = length a2 -> array_exchange a2 a3 o3 j -> (0%Z ≤ j ∧ j - 1%Z < j) ∧ (0%Z ≤ j - 1%Z ∧ j - 1%Z ≤ i) ∧ a ≡ₚ a3 ∧ (∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q ≤ i -> ¬ q = j - 1%Z -> nth (Z.to_nat p) a3 inhabitant ≤ nth (Z.to_nat q) a3 inhabitant)) else (∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q < i + 1%Z -> nth (Z.to_nat p) a2 inhabitant ≤ nth (Z.to_nat q) a2 inhabitant) ∧ a ≡ₚ a2)))) ∧ ((∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q < o1 + 1%Z -> nth (Z.to_nat p) a1 inhabitant ≤ nth (Z.to_nat q) a1 inhabitant) ∧ a ≡ₚ a1 -> (∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q < Z.of_nat (length a1) -> nth (Z.to_nat p) a1 inhabitant ≤ nth (Z.to_nat q) a1 inhabitant) ∧ a ≡ₚ a1))) ∧ (o1 + 1%Z < 1%Z -> (∀(p : Z) (q : Z), 0%Z ≤ p ∧ p ≤ q ∧ q < Z.of_nat (length a) -> nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat q) a inhabitant) ∧ a ≡ₚ a).
Proof.
Admitted.
