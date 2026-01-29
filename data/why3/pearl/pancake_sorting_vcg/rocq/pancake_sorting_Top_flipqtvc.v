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
Theorem flip'vc (i : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i < Z.of_nat (length a)) : let n : Z := Z.of_nat (length a) in ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem (n - i) 2%Z - 1%Z in (0%Z ≤ o1 + 1%Z -> ((∀(j : Z), i ≤ j ∧ j < i + 0%Z -> nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (n - 1%Z - (j - i))) a inhabitant) ∧ (∀(j : Z), n - 0%Z ≤ j ∧ j < n -> nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (n - 1%Z - (j - i))) a inhabitant) ∧ a ≡ₚ a) ∧ (∀(a1 : list Z), length a1 = length a -> (∀(k : Z), (0%Z ≤ k ∧ k ≤ o1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(j : Z), i ≤ j ∧ j < i + k -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat (n - 1%Z - (j - i))) a inhabitant) ∧ (∀(j : Z), i + k ≤ j ∧ j < n - k -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(j : Z), n - k ≤ j ∧ j < n -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat (n - 1%Z - (j - i))) a inhabitant) ∧ a ≡ₚ a1 -> (let o2 : Z := n - 1%Z - k in let o3 : Z := i + k in ((0%Z ≤ o3 ∧ o3 < Z.of_nat (length a1)) ∧ 0%Z ≤ o2 ∧ o2 < Z.of_nat (length a1)) ∧ (∀(a2 : list Z), length a2 = length a1 -> array_exchange a1 a2 o3 o2 -> (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a2 inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(j : Z), i ≤ j ∧ j < i + (k + 1%Z) -> nth (Z.to_nat j) a2 inhabitant = nth (Z.to_nat (n - 1%Z - (j - i))) a inhabitant) ∧ (∀(j : Z), i + (k + 1%Z) ≤ j ∧ j < n - (k + 1%Z) -> nth (Z.to_nat j) a2 inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(j : Z), n - (k + 1%Z) ≤ j ∧ j < n -> nth (Z.to_nat j) a2 inhabitant = nth (Z.to_nat (n - 1%Z - (j - i))) a inhabitant) ∧ a ≡ₚ a2))) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(j : Z), i ≤ j ∧ j < i + (o1 + 1%Z) -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat (n - 1%Z - (j - i))) a inhabitant) ∧ (∀(j : Z), i + (o1 + 1%Z) ≤ j ∧ j < n - (o1 + 1%Z) -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(j : Z), n - (o1 + 1%Z) ≤ j ∧ j < n -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat (n - 1%Z - (j - i))) a inhabitant) ∧ a ≡ₚ a1 -> (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(j : Z), i ≤ j ∧ j < Z.of_nat (length a1) -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat (Z.of_nat (length a1) - 1%Z - (j - i))) a inhabitant) ∧ a ≡ₚ a1))) ∧ (o1 + 1%Z < 0%Z -> (∀(j : Z), i ≤ j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (Z.of_nat (length a) - 1%Z - (j - i))) a inhabitant) ∧ a ≡ₚ a)).
Proof.
Admitted.
