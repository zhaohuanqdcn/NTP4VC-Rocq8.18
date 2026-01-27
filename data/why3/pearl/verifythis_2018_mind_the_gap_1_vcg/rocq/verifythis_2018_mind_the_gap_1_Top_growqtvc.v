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
Theorem grow'vc (k : Z) (g : gap_buffer) (fact0 : 0%Z < k) : let o1 : Z := Z.of_nat (length (a g)) + k in 0%Z ≤ o1 ∧ (∀(b : list char), (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) b inhabitant = any_char) ∧ Z.of_nat (length b) = o1 -> (let o2 : Z := l g in let o3 : list char := a g in ((0%Z ≤ 0%Z ∧ 0%Z ≤ o2 ∧ 0%Z + o2 ≤ Z.of_nat (length o3)) ∧ 0%Z ≤ 0%Z ∧ 0%Z + o2 ≤ Z.of_nat (length b)) ∧ (∀(b1 : list char), length b1 = length b -> (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z ∨ 0%Z + o2 ≤ i ∧ i < Z.of_nat (length b1) -> nth (Z.to_nat i) b1 inhabitant = nth (Z.to_nat i) b inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z + o2 -> nth (Z.to_nat i) b1 inhabitant = nth (Z.to_nat (0%Z + i - 0%Z)) o3 inhabitant) -> (let o4 : Z := Z.of_nat (length (a g)) - r g in let o5 : Z := r g + k in let o6 : Z := r g in let o7 : list char := a g in ((0%Z ≤ o6 ∧ 0%Z ≤ o4 ∧ o6 + o4 ≤ Z.of_nat (length o7)) ∧ 0%Z ≤ o5 ∧ o5 + o4 ≤ Z.of_nat (length b1)) ∧ (∀(b2 : list char), length b2 = length b1 -> (∀(i : Z), 0%Z ≤ i ∧ i < o5 ∨ o5 + o4 ≤ i ∧ i < Z.of_nat (length b2) -> nth (Z.to_nat i) b2 inhabitant = nth (Z.to_nat i) b1 inhabitant) ∧ (∀(i : Z), o5 ≤ i ∧ i < o5 + o4 -> nth (Z.to_nat i) b2 inhabitant = nth (Z.to_nat (o6 + i - o5)) o7 inhabitant) -> (∀(g1 : gap_buffer), ((0%Z ≤ l g ∧ l g ≤ r g + k ∧ r g + k ≤ Z.of_nat (length b2)) ∧ Z.of_nat (length b2) = Z.of_nat (length (content g)) + (r g + k) - l g ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l g -> nth (Z.to_nat i) (content g) inhabitant = nth_i b2 i) ∧ (∀(i : Z), l g ≤ i ∧ i < Z.of_nat (length (content g)) -> nth (Z.to_nat i) (content g) inhabitant = nth_i b2 (i + (r g + k) - l g))) ∧ (content g = content g1 ∧ r g + k = r g1 ∧ l g = l g1 ∧ b2 = a g1 -> (l g1 = l g ∧ content g1 = content g) ∧ l g1 < r g1))))))).
Admitted.
