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
Open Scope Z_scope.
Theorem prime_factor'vc (n : Z) (fact0 : 2%Z ≤ n) : (2%Z ≤ n + 1%Z -> (∀(d : Z), 2%Z ≤ d ∧ d < 2%Z -> ¬ (d | n)) ∧ (∀(p : Z), (2%Z ≤ p ∧ p ≤ n) ∧ (∀(d : Z), 2%Z ≤ d ∧ d < p -> ¬ (d | n)) -> ¬ p = 0%Z ∧ (if decide (Z.quot n p = 0%Z) then prime p ∧ (p | n) else ∀(d : Z), 2%Z ≤ d ∧ d < p + 1%Z -> ¬ (d | n))) ∧ ((∀(d : Z), 2%Z ≤ d ∧ d < n + 1%Z -> ¬ (d | n)) -> prime n ∧ (n | n))) ∧ (n + 1%Z < 2%Z -> prime n ∧ (n | n)).
Admitted.
