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
Open Scope Z_scope.
Definition no_prime_in (l : Z) (u : Z) := ∀(x : Z), l < x ∧ x < u -> ¬ prime x.
Definition first_primes (p : Z -> Z) (u : Z) := p 0%Z = 2%Z ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < u -> p i < p j) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < u -> prime (p i)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < u - 1%Z -> no_prime_in (p i) (p (i + 1%Z))).
Axiom Bertrand_postulate : forall  (p : Z) (fact0 : prime p), ¬ no_prime_in p (2%Z * p).
Theorem bench'vc : 2%Z ≤ 100%Z ∧ (∀(t : list Z), Z.of_nat (length t) = 100%Z ∧ first_primes (nth_i t) 100%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length t)) ∧ (nth 0%nat t inhabitant = 2%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length t)) ∧ (nth 1%nat t inhabitant = 3%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length t)) ∧ (nth 2%nat t inhabitant = 5%Z -> (0%Z ≤ 3%Z ∧ 3%Z < Z.of_nat (length t)) ∧ (nth 3%nat t inhabitant = 7%Z -> (0%Z ≤ 4%Z ∧ 4%Z < Z.of_nat (length t)) ∧ (nth 4%nat t inhabitant = 11%Z -> (0%Z ≤ 5%Z ∧ 5%Z < Z.of_nat (length t)) ∧ (nth 5%nat t inhabitant = 13%Z -> (0%Z ≤ 6%Z ∧ 6%Z < Z.of_nat (length t)) ∧ (nth 6%nat t inhabitant = 17%Z -> (0%Z ≤ 7%Z ∧ 7%Z < Z.of_nat (length t)) ∧ (nth 7%nat t inhabitant = 19%Z -> (0%Z ≤ 8%Z ∧ 8%Z < Z.of_nat (length t)) ∧ (nth 8%nat t inhabitant = 23%Z -> 0%Z ≤ 9%Z ∧ 9%Z < Z.of_nat (length t))))))))))).
Proof.
Admitted.
