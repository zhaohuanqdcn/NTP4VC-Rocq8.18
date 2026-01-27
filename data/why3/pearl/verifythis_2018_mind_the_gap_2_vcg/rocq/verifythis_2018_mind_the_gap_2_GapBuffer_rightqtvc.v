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
Theorem right'vc (b : buffer) : if decide (¬ r b = Z.of_nat (length (data b))) then let o1 : Z := r b in let o2 : list char := data b in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length o2)) ∧ (let o3 : char := nth (Z.to_nat o1) o2 inhabitant in let o4 : Z := l b in let o5 : list char := data b in (0%Z ≤ o4 ∧ o4 < Z.of_nat (length o5)) ∧ (length (set_list o5 (Z.to_nat o4) o3) = length o5 -> length (set_list o5 (Z.to_nat o4) o3) = length (data b) -> nth_i (set_list o5 (Z.to_nat o4) o3) = fun_updt (nth_i o5) o4 o3 -> (∀(b1 : buffer), (0%Z ≤ l b + 1%Z ∧ l b + 1%Z ≤ r b + 1%Z ∧ r b + 1%Z ≤ Z.of_nat (length (set_list o5 (Z.to_nat o4) o3))) ∧ (r b + 1%Z = r b1 ∧ l b + 1%Z = l b1 ∧ set_list o5 (Z.to_nat o4) o3 = data b1 -> (if decide (r b = Z.of_nat (length (data b))) then b1 = b else l b1 = l b + 1%Z) ∧ same_contents b1 b)))) else (¬ r b = Z.of_nat (length (data b)) -> l b = l b + 1%Z) ∧ same_contents b b.
Admitted.
