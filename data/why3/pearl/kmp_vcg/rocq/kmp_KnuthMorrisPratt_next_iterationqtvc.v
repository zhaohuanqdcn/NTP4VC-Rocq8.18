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
Definition matches1 (a1 : list char) (i1 : Z) (a2 : list char) (i2 : Z) (n : Z) := (0%Z ≤ i1 ∧ i1 ≤ Z.of_nat (length a1) - n) ∧ (0%Z ≤ i2 ∧ i2 ≤ Z.of_nat (length a2) - n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < n -> nth (Z.to_nat (i1 + i)) a1 inhabitant = nth (Z.to_nat (i2 + i)) a2 inhabitant).
Definition is_next (p : list char) (j : Z) (n : Z) := (0%Z ≤ n ∧ n < j) ∧ matches1 p (j - n) p 0%Z n ∧ (∀(z : Z), n < z ∧ z < j -> ¬ matches1 p (j - z) p 0%Z z).
Theorem next_iteration'vc (j : Z) (p : list char) (i : Z) (a : list char) (n : Z) (fact0 : 0%Z < j) (fact1 : j < Z.of_nat (length p)) (fact2 : j ≤ i) (fact3 : i ≤ Z.of_nat (length a)) (fact4 : matches1 a (i - j) p 0%Z j) (fact5 : is_next p j n) : matches1 a (i - n) p 0%Z n.
Proof.
Admitted.
