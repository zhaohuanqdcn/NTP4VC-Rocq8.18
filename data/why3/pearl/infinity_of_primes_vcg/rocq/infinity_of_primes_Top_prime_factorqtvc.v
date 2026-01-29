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
Open Scope Z_scope.
Theorem prime_factor'vc (n : Z) (fact0 : 2%Z ≤ n) : (2%Z ≤ n + 1%Z -> (∀(d : Z), 2%Z ≤ d ∧ d < 2%Z -> ¬ (d | n)) ∧ (∀(p : Z), (2%Z ≤ p ∧ p ≤ n) ∧ (∀(d : Z), 2%Z ≤ d ∧ d < p -> ¬ (d | n)) -> ¬ p = 0%Z ∧ (if decide (Z.quot n p = 0%Z) then prime p ∧ (p | n) else ∀(d : Z), 2%Z ≤ d ∧ d < p + 1%Z -> ¬ (d | n))) ∧ ((∀(d : Z), 2%Z ≤ d ∧ d < n + 1%Z -> ¬ (d | n)) -> prime n ∧ (n | n))) ∧ (n + 1%Z < 2%Z -> prime n ∧ (n | n)).
Proof.
Admitted.
