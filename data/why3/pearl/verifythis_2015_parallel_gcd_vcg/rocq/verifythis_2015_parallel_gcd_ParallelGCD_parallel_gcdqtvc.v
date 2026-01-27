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
Theorem parallel_gcd'vc (a0 : Z) (b0 : Z) (fact0 : 0%Z < a0) (fact1 : 0%Z < b0) : 0%Z < a0 ∧ a0 ≤ a0 ∧ 0%Z < b0 ∧ b0 ≤ b0 ∧ (∀(b : Z) (a : Z), ((0%Z < a ∧ a ≤ a0) ∧ 0%Z < b ∧ b ≤ b0) ∧ Z.gcd a b = Z.gcd a0 b0 -> (if decide (¬ a = b) then ∀(o1 : bool), if decide (o1 = true) then if decide (b < a) then ((0%Z < a - b ∧ a - b ≤ a0) ∧ 0%Z < b ∧ b ≤ b0) ∧ Z.gcd (a - b) b = Z.gcd a0 b0 else ((0%Z < a ∧ a ≤ a0) ∧ 0%Z < b ∧ b ≤ b0) ∧ Z.gcd a b = Z.gcd a0 b0 else if decide (a < b) then ((0%Z < a ∧ a ≤ a0) ∧ 0%Z < b - a ∧ b - a ≤ b0) ∧ Z.gcd a (b - a) = Z.gcd a0 b0 else ((0%Z < a ∧ a ≤ a0) ∧ 0%Z < b ∧ b ≤ b0) ∧ Z.gcd a b = Z.gcd a0 b0 else a = Z.gcd a0 b0)).
Admitted.
