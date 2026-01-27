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
Axiom any_char : char.
Axiom gap_buffer : Type.
Axiom gap_buffer_inhabited : Inhabited gap_buffer.
Global Existing Instance gap_buffer_inhabited.
Axiom gap_buffer_countable : Countable gap_buffer.
Global Existing Instance gap_buffer_countable.
Axiom a : gap_buffer -> list char.
Axiom l : gap_buffer -> Z.
Axiom r : gap_buffer -> Z.
Axiom content : gap_buffer -> list char.
Axiom gap_buffer'invariant : forall  (self : gap_buffer), 0%Z ≤ l self ∧ l self ≤ r self ∧ r self ≤ Z.of_nat (length (a self)) ∧ Z.of_nat (length (a self)) = Z.of_nat (length (content self)) + r self - l self ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l self -> nth (Z.to_nat i) (content self) inhabitant = nth_i (a self) i) ∧ (∀(i : Z), l self ≤ i ∧ i < Z.of_nat (length (content self)) -> nth (Z.to_nat i) (content self) inhabitant = nth_i (a self) (i + r self - l self)).
Definition gap_buffer'eq (a1 : gap_buffer) (b : gap_buffer) := a a1 = a b ∧ l a1 = l b ∧ r a1 = r b ∧ content a1 = content b.
Axiom gap_buffer'inj : forall  (a1 : gap_buffer) (b : gap_buffer) (fact0 : gap_buffer'eq a1 b), a1 = b.
Theorem right'vc (g : gap_buffer) : if decide (¬ r g = Z.of_nat (length (a g))) then let o1 : Z := r g in let o2 : list char := a g in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length o2)) ∧ (let o3 : char := nth (Z.to_nat o1) o2 inhabitant in let o4 : Z := l g in let o5 : list char := a g in (0%Z ≤ o4 ∧ o4 < Z.of_nat (length o5)) ∧ (length (set_list o5 (Z.to_nat o4) o3) = length o5 -> length (set_list o5 (Z.to_nat o4) o3) = length (a g) -> nth_i (set_list o5 (Z.to_nat o4) o3) = fun_updt (nth_i o5) o4 o3 -> (∀(g1 : gap_buffer), ((0%Z ≤ l g + 1%Z ∧ l g + 1%Z ≤ r g + 1%Z ∧ r g + 1%Z ≤ Z.of_nat (length (set_list o5 (Z.to_nat o4) o3))) ∧ Z.of_nat (length (set_list o5 (Z.to_nat o4) o3)) = Z.of_nat (length (content g)) + (r g + 1%Z) - (l g + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l g + 1%Z -> nth (Z.to_nat i) (content g) inhabitant = nth_i (set_list o5 (Z.to_nat o4) o3) i) ∧ (∀(i : Z), l g + 1%Z ≤ i ∧ i < Z.of_nat (length (content g)) -> nth (Z.to_nat i) (content g) inhabitant = nth_i (set_list o5 (Z.to_nat o4) o3) (i + (r g + 1%Z) - (l g + 1%Z)))) ∧ (content g = content g1 ∧ r g + 1%Z = r g1 ∧ l g + 1%Z = l g1 ∧ set_list o5 (Z.to_nat o4) o3 = a g1 -> l g1 = (if decide (l g = Z.of_nat (length (content g))) then l g else l g + 1%Z) ∧ content g1 = content g)))) else l g = (if decide (l g = Z.of_nat (length (content g))) then l g else l g + 1%Z).
Admitted.
