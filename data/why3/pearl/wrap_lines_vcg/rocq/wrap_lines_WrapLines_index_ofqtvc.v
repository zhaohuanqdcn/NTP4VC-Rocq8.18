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
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom space : char.
Axiom newline : char.
Theorem index_of'vc (from1 : Z) (s : list char) (c : char) (fact0 : 0%Z ≤ from1) (fact1 : from1 ≤ Z.of_nat (length s)) : from1 ≤ from1 ∧ from1 ≤ Z.of_nat (length s) ∧ (∀(i : Z), from1 ≤ i ∧ i < from1 -> ¬ nth (Z.to_nat i) s inhabitant = c) ∧ (∀(k : Z), (from1 ≤ k ∧ k ≤ Z.of_nat (length s)) ∧ (∀(i : Z), from1 ≤ i ∧ i < k -> ¬ nth (Z.to_nat i) s inhabitant = c) -> (if decide (k < Z.of_nat (length s)) then (0%Z ≤ k ∧ k < Z.of_nat (length s)) ∧ (if decide (nth (Z.to_nat k) s inhabitant = c) then k = - 1%Z ∧ (∀(i : Z), from1 ≤ i ∧ i < Z.of_nat (length s) -> ¬ nth (Z.to_nat i) s inhabitant = c) ∨ (from1 ≤ k ∧ k < Z.of_nat (length s)) ∧ nth (Z.to_nat k) s inhabitant = c ∧ (∀(i : Z), from1 ≤ i ∧ i < k -> ¬ nth (Z.to_nat i) s inhabitant = c) else (0%Z ≤ Z.of_nat (length s) - k ∧ Z.of_nat (length s) - (k + 1%Z) < Z.of_nat (length s) - k) ∧ (from1 ≤ k + 1%Z ∧ k + 1%Z ≤ Z.of_nat (length s)) ∧ (∀(i : Z), from1 ≤ i ∧ i < k + 1%Z -> ¬ nth (Z.to_nat i) s inhabitant = c)) else (∀(i : Z), from1 ≤ i ∧ i < Z.of_nat (length s) -> ¬ nth (Z.to_nat i) s inhabitant = c) ∨ (from1 ≤ - 1%Z ∧ - 1%Z < Z.of_nat (length s)) ∧ nth (Z.to_nat (- 1%Z)) s inhabitant = c ∧ (∀(i : Z), from1 ≤ i ∧ i < - 1%Z -> ¬ nth (Z.to_nat i) s inhabitant = c))).
Proof.
Admitted.
