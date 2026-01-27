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
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom front : forall {α : Type} `{Inhabited α}, t α -> list α.
Axiom rear : forall {α : Type} `{Inhabited α}, t α -> list α.
Axiom seq : forall {α : Type} `{Inhabited α}, t α -> list α.
Axiom t'invariant : forall  {α : Type} `{Inhabited α} (self : t α), Z.of_nat (length (seq self)) = Z.of_nat (length (front self)) + Z.of_nat (length (rear self)) ∧ (0%Z < Z.of_nat (length (front self)) -> 0%Z < Z.of_nat (length (rear self))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (seq self)) -> nth (Z.to_nat i) (seq self) inhabitant = (let n : Z := Z.of_nat (length (rear self)) in if decide (i < n) then nth (Z.to_nat i) (rear self) inhabitant else nth (Z.to_nat (Z.of_nat (length (front self)) - 1%Z - (i - n))) (front self) inhabitant)).
Definition t'eq {α : Type} `{Inhabited α} (a : t α) (b : t α) := front a = front b ∧ rear a = rear b ∧ seq a = seq b.
Axiom t'inj : forall  {α : Type} `{Inhabited α} (a : t α) (b : t α) (fact0 : t'eq a b), a = b.
Theorem pop'vc {α : Type} `{Inhabited α} (q : t α) : match rear q with | [] => seq q = ([] : list α) | cons x [] => (0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (length (seq q))) ∧ (∀(q1 : t α), (Z.of_nat (length (drop 1%nat (seq q))) = Z.of_nat (length ([] : list α)) + Z.of_nat (length (rev (front q))) ∧ (0%Z < Z.of_nat (length ([] : list α)) -> 0%Z < Z.of_nat (length (rev (front q)))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (drop 1%nat (seq q))) -> nth (Z.to_nat i) (drop 1%nat (seq q)) inhabitant = (let n : Z := Z.of_nat (length (rev (front q))) in if decide (i < n) then nth (Z.to_nat i) (rev (front q)) inhabitant else nth (Z.to_nat (Z.of_nat (length ([] : list α)) - 1%Z - (i - n))) ([] : list α) inhabitant))) ∧ (drop 1%nat (seq q) = seq q1 ∧ rev (front q) = rear q1 ∧ ([] : list α) = front q1 -> ¬ seq q = ([] : list α) ∧ x = nth 0%nat (seq q) inhabitant ∧ seq q1 = drop 1%nat (seq q))) | cons x s => (0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (length (seq q))) ∧ (∀(q1 : t α), (Z.of_nat (length (drop 1%nat (seq q))) = Z.of_nat (length (front q)) + Z.of_nat (length s) ∧ (0%Z < Z.of_nat (length (front q)) -> 0%Z < Z.of_nat (length s)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (drop 1%nat (seq q))) -> nth (Z.to_nat i) (drop 1%nat (seq q)) inhabitant = (let n : Z := Z.of_nat (length s) in if decide (i < n) then nth (Z.to_nat i) s inhabitant else nth (Z.to_nat (Z.of_nat (length (front q)) - 1%Z - (i - n))) (front q) inhabitant))) ∧ (drop 1%nat (seq q) = seq q1 ∧ s = rear q1 ∧ front q = front q1 -> ¬ seq q = ([] : list α) ∧ x = nth 0%nat (seq q) inhabitant ∧ seq q1 = drop 1%nat (seq q))) end.
Admitted.
