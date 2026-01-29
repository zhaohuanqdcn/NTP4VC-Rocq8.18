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
Theorem exists_prime'vc (u : Z) (p : Z -> Z) (d : Z) (fact0 : 1%Z ≤ u) (fact1 : first_primes p u) (fact2 : 2%Z ≤ d) (fact3 : d ≤ p (u - 1%Z)) (fact4 : prime d) : ∃(i : Z), (0%Z ≤ i ∧ i < u) ∧ d = p i.
Proof.
Admitted.
