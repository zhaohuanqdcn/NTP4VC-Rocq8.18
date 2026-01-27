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
Open Scope Z_scope.
Theorem all_distinct'vc (m : Z) (a : list Z) (fact0 : 0%Z ≤ m) (fact1 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 0%Z ≤ nth (Z.to_nat i) a inhabitant ∧ nth (Z.to_nat i) a inhabitant < m) : 0%Z ≤ m ∧ (∀(dejavu : list bool), (∀(i : Z), 0%Z ≤ i ∧ i < m -> nth (Z.to_nat i) dejavu inhabitant = false) ∧ Z.of_nat (length dejavu) = m -> (let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> ((∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < 0%Z -> 0%Z ≤ j ∧ j < 0%Z -> ¬ i = j -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(x : Z), 0%Z ≤ x ∧ x < m -> (nth (Z.to_nat x) dejavu inhabitant = true) = (∃(i : Z), (0%Z ≤ i ∧ i < 0%Z) ∧ nth (Z.to_nat i) a inhabitant = x))) ∧ (∀(dejavu1 : list bool), length dejavu1 = length dejavu -> (∀(k : Z), (0%Z ≤ k ∧ k ≤ o1) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < k -> 0%Z ≤ j ∧ j < k -> ¬ i = j -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(x : Z), 0%Z ≤ x ∧ x < m -> (nth (Z.to_nat x) dejavu1 inhabitant = true) = (∃(i : Z), (0%Z ≤ i ∧ i < k) ∧ nth (Z.to_nat i) a inhabitant = x)) -> (0%Z ≤ k ∧ k < Z.of_nat (length a)) ∧ (let v : Z := nth (Z.to_nat k) a inhabitant in (0%Z ≤ v ∧ v < Z.of_nat (length dejavu1)) ∧ (if decide (nth (Z.to_nat v) dejavu1 inhabitant = true) then ¬ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 0%Z ≤ j ∧ j < Z.of_nat (length a) -> ¬ i = j -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) else let o2 : bool := true in (0%Z ≤ v ∧ v < Z.of_nat (length dejavu1)) ∧ (length (set_list dejavu1 (Z.to_nat v) o2) = length dejavu1 -> nth_i (set_list dejavu1 (Z.to_nat v) o2) = fun_updt (nth_i dejavu1) v o2 -> (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < k + 1%Z -> 0%Z ≤ j ∧ j < k + 1%Z -> ¬ i = j -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(x : Z), 0%Z ≤ x ∧ x < m -> (nth (Z.to_nat x) (set_list dejavu1 (Z.to_nat v) o2) inhabitant = true) = (∃(i : Z), (0%Z ≤ i ∧ i < k + 1%Z) ∧ nth (Z.to_nat i) a inhabitant = x)))))) ∧ ((∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < o1 + 1%Z -> 0%Z ≤ j ∧ j < o1 + 1%Z -> ¬ i = j -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(x : Z), 0%Z ≤ x ∧ x < m -> (nth (Z.to_nat x) dejavu1 inhabitant = true) = (∃(i : Z), (0%Z ≤ i ∧ i < o1 + 1%Z) ∧ nth (Z.to_nat i) a inhabitant = x)) -> (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 0%Z ≤ j ∧ j < Z.of_nat (length a) -> ¬ i = j -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant)))) ∧ (o1 + 1%Z < 0%Z -> (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 0%Z ≤ j ∧ j < Z.of_nat (length a) -> ¬ i = j -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant)))).
Admitted.
