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
Definition is_partition (a : list Z) := 0%Z < Z.of_nat (length a) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i ≤ j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat j) a inhabitant ≤ nth (Z.to_nat i) a inhabitant) ∧ nth (Z.to_nat (Z.of_nat (length a) - 1%Z)) a inhabitant = 0%Z.
Definition numofgt (a : list Z) (n : Z) (v : Z) := (0%Z ≤ n ∧ n < Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < n -> v < nth (Z.to_nat j) a inhabitant) ∧ nth (Z.to_nat n) a inhabitant ≤ v.
Definition is_conjugate (a : list Z) (b : list Z) := nth 0%nat a inhabitant < Z.of_nat (length b) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length b) -> numofgt a (nth (Z.to_nat j) b inhabitant) j).
Theorem conjugate'vc (a : list Z) (fact0 : is_partition a) : 0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a) ∧ (let o1 : Z := nth 0%nat a inhabitant + 1%Z in 0%Z ≤ o1 ∧ (∀(b : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) b inhabitant = 0%Z) ∧ Z.of_nat (length b) = o1 -> ((0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (∀(j : Z), nth 0%nat a inhabitant ≤ j ∧ j < Z.of_nat (length b) -> numofgt a (nth (Z.to_nat j) b inhabitant) j)) ∧ (∀(partc : Z) (b1 : list Z), length b1 = length b -> (0%Z ≤ partc ∧ partc < Z.of_nat (length a)) ∧ (∀(j : Z), nth (Z.to_nat partc) a inhabitant ≤ j ∧ j < Z.of_nat (length b1) -> numofgt a (nth (Z.to_nat j) b1 inhabitant) j) -> (0%Z ≤ partc ∧ partc < Z.of_nat (length a)) ∧ (if decide (¬ nth (Z.to_nat partc) a inhabitant = 0%Z) then (0%Z ≤ partc ∧ partc < Z.of_nat (length a)) ∧ (let edge : Z := nth (Z.to_nat partc) a inhabitant in ((partc ≤ partc + 1%Z ∧ partc + 1%Z < Z.of_nat (length a)) ∧ (∀(j : Z), partc ≤ j ∧ j < partc + 1%Z -> nth (Z.to_nat j) a inhabitant = edge)) ∧ (∀(partc1 : Z), (partc ≤ partc1 ∧ partc1 < Z.of_nat (length a)) ∧ (∀(j : Z), partc ≤ j ∧ j < partc1 -> nth (Z.to_nat j) a inhabitant = edge) -> (0%Z ≤ partc1 ∧ partc1 < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat partc1) a inhabitant = edge) then (0%Z ≤ Z.of_nat (length a) - partc1 ∧ Z.of_nat (length a) - (partc1 + 1%Z) < Z.of_nat (length a) - partc1) ∧ (partc ≤ partc1 + 1%Z ∧ partc1 + 1%Z < Z.of_nat (length a)) ∧ (∀(j : Z), partc ≤ j ∧ j < partc1 + 1%Z -> nth (Z.to_nat j) a inhabitant = edge) else let o2 : Z := edge - 1%Z in (0%Z ≤ partc1 ∧ partc1 < Z.of_nat (length a)) ∧ (let o3 : Z := nth (Z.to_nat partc1) a inhabitant in (o3 ≤ o2 + 1%Z -> (∀(j : Z), nth (Z.to_nat partc1) a inhabitant ≤ j ∧ j < o3 -> nth (Z.to_nat j) b1 inhabitant = partc1) ∧ (∀(b2 : list Z), length b2 = length b1 -> (∀(i : Z), (o3 ≤ i ∧ i ≤ o2) ∧ (∀(j : Z), edge ≤ j ∧ j < Z.of_nat (length b2) -> nth (Z.to_nat j) b2 inhabitant = nth (Z.to_nat j) b1 inhabitant) ∧ (∀(j : Z), nth (Z.to_nat partc1) a inhabitant ≤ j ∧ j < i -> nth (Z.to_nat j) b2 inhabitant = partc1) -> (0%Z ≤ i ∧ i < Z.of_nat (length b2)) ∧ (length (set_list b2 (Z.to_nat i) partc1) = length b2 -> nth_i (set_list b2 (Z.to_nat i) partc1) = fun_updt (nth_i b2) i partc1 -> (∀(j : Z), edge ≤ j ∧ j < Z.of_nat (length (set_list b2 (Z.to_nat i) partc1)) -> nth (Z.to_nat j) (set_list b2 (Z.to_nat i) partc1) inhabitant = nth (Z.to_nat j) b1 inhabitant) ∧ (∀(j : Z), nth (Z.to_nat partc1) a inhabitant ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat j) (set_list b2 (Z.to_nat i) partc1) inhabitant = partc1))) ∧ ((∀(j : Z), edge ≤ j ∧ j < Z.of_nat (length b2) -> nth (Z.to_nat j) b2 inhabitant = nth (Z.to_nat j) b1 inhabitant) ∧ (∀(j : Z), nth (Z.to_nat partc1) a inhabitant ≤ j ∧ j < o2 + 1%Z -> nth (Z.to_nat j) b2 inhabitant = partc1) -> (0%Z ≤ Z.of_nat (length a) - partc ∧ Z.of_nat (length a) - partc1 < Z.of_nat (length a) - partc) ∧ (0%Z ≤ partc1 ∧ partc1 < Z.of_nat (length a)) ∧ (∀(j : Z), nth (Z.to_nat partc1) a inhabitant ≤ j ∧ j < Z.of_nat (length b2) -> numofgt a (nth (Z.to_nat j) b2 inhabitant) j)))) ∧ (o2 + 1%Z < o3 -> (0%Z ≤ Z.of_nat (length a) - partc ∧ Z.of_nat (length a) - partc1 < Z.of_nat (length a) - partc) ∧ (0%Z ≤ partc1 ∧ partc1 < Z.of_nat (length a)) ∧ (∀(j : Z), nth (Z.to_nat partc1) a inhabitant ≤ j ∧ j < Z.of_nat (length b1) -> numofgt a (nth (Z.to_nat j) b1 inhabitant) j)))))) else is_conjugate a b1)))).
Admitted.
