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
Theorem infinity_of_primes'vc (n : Z) (fact0 : 0%Z ≤ n) : let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> (1%Z ≤ 1%Z ∧ Z.of_nat (size (∅ : gset Z)) = 0%Z ∧ (∀(k : Z), k ∈ (∅ : gset Z) -> prime k) ∧ (∀(k : Z), k ∈ (∅ : gset Z) -> (k | 1%Z))) ∧ (∀(x : Z) (s : gset Z), ((0%Z ≤ Z.of_nat (size s) ∧ Z.of_nat (size s) ≤ o1) ∧ 1%Z ≤ x ∧ (∀(k : Z), k ∈ s -> prime k) ∧ (∀(k : Z), k ∈ s -> (k | x)) -> 1%Z ≤ x * (x + 1%Z) ∧ Z.of_nat (size (insert_set (x + 1%Z) s)) = Z.of_nat (size s) + 1%Z ∧ (∀(k : Z), k ∈ insert_set (x + 1%Z) s -> prime k) ∧ (∀(k : Z), k ∈ insert_set (x + 1%Z) s -> (k | x * (x + 1%Z)))) ∧ (1%Z ≤ x ∧ Z.of_nat (size s) = o1 + 1%Z ∧ (∀(k : Z), k ∈ s -> prime k) ∧ (∀(k : Z), k ∈ s -> (k | x)) -> Z.of_nat (size s) = n ∧ (∀(k : Z), k ∈ s -> prime k)))) ∧ (o1 + 1%Z < 0%Z -> (let s : gset Z := (∅ : gset Z) in Z.of_nat (size s) = n ∧ (∀(k : Z), k ∈ s -> prime k))).
Proof.
Admitted.
