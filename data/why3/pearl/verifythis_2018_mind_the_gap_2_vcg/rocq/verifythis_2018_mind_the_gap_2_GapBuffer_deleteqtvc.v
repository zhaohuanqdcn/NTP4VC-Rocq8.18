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
Definition contents_inserted (newb : buffer) (oldb : buffer) (x : char) (pos : Z) := len_contents newb = len_contents oldb + 1%Z ∧ (0%Z ≤ pos ∧ pos ≤ len_contents oldb) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < pos -> contents newb i = contents oldb i) ∧ contents newb pos = x ∧ (∀(i : Z), pos < i ∧ i < len_contents newb -> contents newb i = contents oldb (i - 1%Z)).
Definition contents_deleted (newb : buffer) (oldb : buffer) (pos : Z) := len_contents newb = len_contents oldb - 1%Z ∧ (0%Z ≤ pos ∧ pos < len_contents oldb) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < pos -> contents newb i = contents oldb i) ∧ (∀(i : Z), pos ≤ i ∧ i < len_contents newb -> contents newb i = contents oldb (i + 1%Z)).
Theorem delete'vc (b : buffer) : if decide (¬ l b = 0%Z) then ∀(b1 : buffer), (0%Z ≤ l b - 1%Z ∧ l b - 1%Z ≤ r b ∧ r b ≤ Z.of_nat (length (data b))) ∧ (r b = r b1 ∧ l b - 1%Z = l b1 ∧ data b = data b1 -> (if decide (l b = 0%Z) then b1 = b else l b1 = l b - 1%Z ∧ contents_deleted b1 b (l b - 1%Z))) else ¬ l b = 0%Z -> l b = l b - 1%Z ∧ contents_deleted b b (l b - 1%Z).
Admitted.
