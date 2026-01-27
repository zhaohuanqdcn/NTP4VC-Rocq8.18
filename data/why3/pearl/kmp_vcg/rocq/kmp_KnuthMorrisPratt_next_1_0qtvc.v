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
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Definition matches1 (a1 : list char) (i1 : Z) (a2 : list char) (i2 : Z) (n : Z) := (0%Z ≤ i1 ∧ i1 ≤ Z.of_nat (length a1) - n) ∧ (0%Z ≤ i2 ∧ i2 ≤ Z.of_nat (length a2) - n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < n -> nth (Z.to_nat (i1 + i)) a1 inhabitant = nth (Z.to_nat (i2 + i)) a2 inhabitant).
Definition is_next (p : list char) (j : Z) (n : Z) := (0%Z ≤ n ∧ n < j) ∧ matches1 p (j - n) p 0%Z n ∧ (∀(z : Z), n < z ∧ z < j -> ¬ matches1 p (j - z) p 0%Z z).
Theorem next_1_0'vc (p : list char) (fact0 : 1%Z ≤ Z.of_nat (length p)) : is_next p 1%Z 0%Z.
Admitted.
