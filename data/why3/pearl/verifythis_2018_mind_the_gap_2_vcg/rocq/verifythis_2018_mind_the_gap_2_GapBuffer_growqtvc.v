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
Theorem grow'vc (b : buffer) : let o1 : Z := Z.of_nat (length (data b)) + 42%Z in 0%Z ≤ o1 ∧ (∀(ndata : list char), (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) ndata inhabitant = dummy_char) ∧ Z.of_nat (length ndata) = o1 -> (let o2 : Z := l b in let o3 : list char := data b in ((0%Z ≤ 0%Z ∧ 0%Z ≤ o2 ∧ 0%Z + o2 ≤ Z.of_nat (length o3)) ∧ 0%Z ≤ 0%Z ∧ 0%Z + o2 ≤ Z.of_nat (length ndata)) ∧ (∀(ndata1 : list char), length ndata1 = length ndata -> (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z ∨ 0%Z + o2 ≤ i ∧ i < Z.of_nat (length ndata1) -> nth (Z.to_nat i) ndata1 inhabitant = nth (Z.to_nat i) ndata inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z + o2 -> nth (Z.to_nat i) ndata1 inhabitant = nth (Z.to_nat (0%Z + i - 0%Z)) o3 inhabitant) -> (let o4 : Z := Z.of_nat (length (data b)) - r b in let o5 : Z := r b + 42%Z in let o6 : Z := r b in let o7 : list char := data b in ((0%Z ≤ o6 ∧ 0%Z ≤ o4 ∧ o6 + o4 ≤ Z.of_nat (length o7)) ∧ 0%Z ≤ o5 ∧ o5 + o4 ≤ Z.of_nat (length ndata1)) ∧ (∀(ndata2 : list char), length ndata2 = length ndata1 -> (∀(i : Z), 0%Z ≤ i ∧ i < o5 ∨ o5 + o4 ≤ i ∧ i < Z.of_nat (length ndata2) -> nth (Z.to_nat i) ndata2 inhabitant = nth (Z.to_nat i) ndata1 inhabitant) ∧ (∀(i : Z), o5 ≤ i ∧ i < o5 + o4 -> nth (Z.to_nat i) ndata2 inhabitant = nth (Z.to_nat (o6 + i - o5)) o7 inhabitant) -> (∀(b1 : buffer), (0%Z ≤ l b ∧ l b ≤ r b + 42%Z ∧ r b + 42%Z ≤ Z.of_nat (length ndata2)) ∧ (r b + 42%Z = r b1 ∧ l b = l b1 ∧ ndata2 = data b1 -> l b1 = l b ∧ r b1 = r b + 42%Z ∧ same_contents b1 b))))))).
Admitted.
