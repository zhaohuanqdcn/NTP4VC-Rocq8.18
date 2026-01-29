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
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom dummy_char : char.
Axiom buffer : Type.
Axiom buffer_inhabited : Inhabited buffer.
Global Existing Instance buffer_inhabited.
Axiom buffer_countable : Countable buffer.
Global Existing Instance buffer_countable.
Axiom data : buffer -> list char.
Axiom l : buffer -> Z.
Axiom r : buffer -> Z.
Axiom buffer'invariant : forall  (self : buffer), 0%Z ≤ l self ∧ l self ≤ r self ∧ r self ≤ Z.of_nat (length (data self)).
Definition buffer'eq (a : buffer) (b : buffer) := data a = data b ∧ l a = l b ∧ r a = r b.
Axiom buffer'inj : forall  (a : buffer) (b : buffer) (fact0 : buffer'eq a b), a = b.
Definition len_contents (b : buffer) : Z := Z.of_nat (length (data b)) - r b + l b.
Axiom contents : buffer -> Z -> char.
Axiom contents'def : forall  (b : buffer) (i : Z), contents b i = (if decide (0%Z ≤ i ∧ i < l b) then nth_i (data b) i else if decide (l b ≤ i ∧ i ≤ len_contents b) then nth_i (data b) (i + r b - l b) else dummy_char).
Definition same_contents (b1 : buffer) (b2 : buffer) := len_contents b1 = len_contents b2 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len_contents b1 -> contents b1 i = contents b2 i).
Theorem left'vc (b : buffer) : if decide (¬ l b = 0%Z) then (0%Z ≤ l b - 1%Z ∧ l b - 1%Z < Z.of_nat (length (data b))) ∧ (let o1 : char := nth (Z.to_nat (l b - 1%Z)) (data b) inhabitant in (0%Z ≤ r b - 1%Z ∧ r b - 1%Z < Z.of_nat (length (data b))) ∧ (∀(b1 : buffer), length (set_list (data b) (Z.to_nat (r b - 1%Z)) o1) = length (data b) -> length (set_list (data b) (Z.to_nat (r b - 1%Z)) o1) = length (data b) -> nth_i (set_list (data b) (Z.to_nat (r b - 1%Z)) o1) = fun_updt (nth_i (data b)) (r b - 1%Z) o1 -> (0%Z ≤ l b - 1%Z ∧ l b - 1%Z ≤ r b - 1%Z ∧ r b - 1%Z ≤ Z.of_nat (length (set_list (data b) (Z.to_nat (r b - 1%Z)) o1))) ∧ (r b - 1%Z = r b1 ∧ l b - 1%Z = l b1 ∧ set_list (data b) (Z.to_nat (r b - 1%Z)) o1 = data b1 -> (if decide (l b = 0%Z) then b1 = b else l b1 = l b - 1%Z) ∧ same_contents b1 b))) else (¬ l b = 0%Z -> l b = l b - 1%Z) ∧ same_contents b b.
Proof.
Admitted.
