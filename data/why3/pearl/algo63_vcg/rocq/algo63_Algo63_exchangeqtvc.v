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
Open Scope Z_scope.
Theorem exchange'vc (m : Z) (i : Z) (n : Z) (a : list Z) (j : Z) (fact0 : 0%Z ≤ m) (fact1 : m ≤ i) (fact2 : i ≤ n) (fact3 : n < Z.of_nat (length a)) (fact4 : m ≤ j) (fact5 : j ≤ n) : 0%Z ≤ i ∧ i < Z.of_nat (length a) ∧ (let v : Z := nth (Z.to_nat i) a inhabitant in (0%Z ≤ j ∧ j < Z.of_nat (length a)) ∧ (let o1 : Z := nth (Z.to_nat j) a inhabitant in (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (length (set_list a (Z.to_nat i) o1) = length a -> nth_i (set_list a (Z.to_nat i) o1) = fun_updt (nth_i a) i o1 -> (0%Z ≤ j ∧ j < Z.of_nat (length (set_list a (Z.to_nat i) o1))) ∧ (length (set_list (set_list a (Z.to_nat i) o1) (Z.to_nat j) v) = length (set_list a (Z.to_nat i) o1) -> nth_i (set_list (set_list a (Z.to_nat i) o1) (Z.to_nat j) v) = fun_updt (nth_i (set_list a (Z.to_nat i) o1)) j v -> array_exchange a (set_list (set_list a (Z.to_nat i) o1) (Z.to_nat j) v) i j ∧ permut_sub' a (set_list (set_list a (Z.to_nat i) o1) (Z.to_nat j) v) (Z.to_nat m) (Z.to_nat (n + 1%Z)))))).
Admitted.
