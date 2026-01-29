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
Require Import euler_sieve_vcg.euler_sieve.ArithmeticResults.
Require Import euler_sieve_vcg.euler_sieve.DivisibilityResults.
Open Scope Z_scope.
Definition inv_nexts (nexts : list Z) (n : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < n -> i < nth (Z.to_nat i) nexts inhabitant ∧ nth (Z.to_nat i) nexts inhabitant ≤ n.
Definition all_eliminated_marked (marked : list bool) (nexts : list Z) := length marked = length nexts ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length marked) -> (∀(j : Z), i < j ∧ j < nth (Z.to_nat i) nexts inhabitant -> nth (Z.to_nat j) marked inhabitant = true)).
Definition all_eliminated_marked_partial (marked : list bool) (nexts : list Z) (min : Z) := length marked = length nexts ∧ (∀(i : Z), min ≤ i ∧ i < Z.of_nat (length marked) -> (∀(j : Z), i < j ∧ j < nth (Z.to_nat i) nexts inhabitant -> nth (Z.to_nat j) marked inhabitant = true)).
Definition not_marked_impl_next_not_marked (marked_old : list bool) (nexts : list Z) (n : Z) := length marked_old = length nexts ∧ 2%Z ≤ Z.of_nat (length marked_old) ∧ 2%Z ≤ n ∧ (∀(i : Z), 2%Z ≤ i ∧ i ≤ ZEuclid.div (Z.of_nat (length marked_old) - 1%Z) n -> nth (Z.to_nat i) nexts inhabitant ≤ ZEuclid.div (Z.of_nat (length marked_old) - 1%Z) n -> ¬ nth (Z.to_nat i) marked_old inhabitant = true -> ¬ nth (Z.to_nat (nth (Z.to_nat i) nexts inhabitant)) marked_old inhabitant = true).
Definition is_copy (marked : list bool) (marked_old : list bool) := length marked = length marked_old ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length marked) -> ¬ nth (Z.to_nat i) marked inhabitant = true -> ¬ nth (Z.to_nat i) marked_old inhabitant = true).
Definition not_marked_impl_next_not_marked_partial (marked : list bool) (nexts : list Z) (n : Z) (p : Z) := length marked = length nexts ∧ 2%Z ≤ Z.of_nat (length marked) ∧ 2%Z ≤ n ∧ p ≤ ZEuclid.div (Z.of_nat (length marked) - 1%Z) n ∧ (∀(i : Z), 2%Z ≤ i ∧ i < p -> nth (Z.to_nat i) nexts inhabitant ≤ ZEuclid.div (Z.of_nat (length marked) - 1%Z) n -> ¬ nth (Z.to_nat i) marked inhabitant = true -> ¬ nth (Z.to_nat (nth (Z.to_nat i) nexts inhabitant)) marked inhabitant = true).
Definition all_primes (marked : list bool) (n : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < n -> (¬ nth (Z.to_nat i) marked inhabitant = true) = prime i.
Definition all_multiples_marked (marked : list bool) (i : Z) (max : Z) := (2%Z ≤ i ∧ i < Z.of_nat (length marked)) ∧ (∀(k : Z), 2%Z ≤ k ∧ k < max -> i * k < Z.of_nat (length marked) -> nth (Z.to_nat (i * k)) marked inhabitant = true).
Definition previously_marked_multiples (marked : list bool) (n : Z) := ∀(i : Z), 2%Z ≤ i ∧ i < n -> all_multiples_marked marked i (Z.of_nat (length marked)).
Definition only_multiples_marked (marked : list bool) (n : Z) := ∀(k : Z), 2%Z ≤ k ∧ k < Z.of_nat (length marked) -> nth (Z.to_nat k) marked inhabitant = true -> (∃(i : Z) (j : Z), (2%Z ≤ i ∧ i < n) ∧ (2%Z ≤ j ∧ j < Z.of_nat (length marked)) ∧ i * j = k).
Definition prime_multiples_marked (marked_old : list bool) (marked : list bool) (n : Z) (max : Z) := length marked_old = length marked ∧ (n < max ∧ max ≤ Z.of_nat (length marked)) ∧ (∀(i : Z), n ≤ i ∧ i < max -> ¬ nth (Z.to_nat i) marked_old inhabitant = true -> n * i < Z.of_nat (length marked_old) -> nth (Z.to_nat (n * i)) marked inhabitant = true).
Definition inv_remove_products (nexts : list Z) (marked : list bool) (n : Z) := length nexts = length marked ∧ ¬ nth 2%nat marked inhabitant = true ∧ all_primes marked n ∧ prime n ∧ ¬ nth (Z.to_nat n) marked inhabitant = true ∧ inv_nexts nexts (Z.of_nat (length nexts)).
Theorem conservation_all_eliminated_marked_on_nexts_change'vc (marked : list bool) (nexts : list Z) (i : Z) (v : Z) (fact0 : length marked = length nexts) (fact1 : all_eliminated_marked marked nexts) (fact2 : inv_nexts nexts (Z.of_nat (length marked))) (fact3 : 0%Z ≤ i) (fact4 : i < Z.of_nat (length marked)) (fact5 : i < v) (fact6 : v ≤ Z.of_nat (length marked)) (fact7 : ∀(j : Z), i < j ∧ j < v -> nth (Z.to_nat j) marked inhabitant = true) : all_eliminated_marked marked (set_list nexts (Z.to_nat i) v).
Proof.
Admitted.
