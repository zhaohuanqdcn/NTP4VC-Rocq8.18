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
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom front : forall {α : Type} `{Inhabited α}, t α -> list α.
Axiom rear : forall {α : Type} `{Inhabited α}, t α -> list α.
Axiom seq : forall {α : Type} `{Inhabited α}, t α -> list α.
Axiom t'invariant : forall  {α : Type} `{Inhabited α} (self : t α), Z.of_nat (length (seq self)) = Z.of_nat (length (front self)) + Z.of_nat (length (rear self)) ∧ (0%Z < Z.of_nat (length (front self)) -> 0%Z < Z.of_nat (length (rear self))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (seq self)) -> nth (Z.to_nat i) (seq self) inhabitant = (let n : Z := Z.of_nat (length (rear self)) in if decide (i < n) then nth (Z.to_nat i) (rear self) inhabitant else nth (Z.to_nat (Z.of_nat (length (front self)) - 1%Z - (i - n))) (front self) inhabitant)).
Definition t'eq {α : Type} `{Inhabited α} (a : t α) (b : t α) := front a = front b ∧ rear a = rear b ∧ seq a = seq b.
Axiom t'inj : forall  {α : Type} `{Inhabited α} (a : t α) (b : t α) (fact0 : t'eq a b), a = b.
Theorem copy'vc {α : Type} `{Inhabited α} (q : t α) : let o1 : list α := seq q in let o2 : list α := rear q in let o3 : list α := front q in (Z.of_nat (length o1) = Z.of_nat (length o3) + Z.of_nat (length o2) ∧ (0%Z < Z.of_nat (length o3) -> 0%Z < Z.of_nat (length o2)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o1) -> nth (Z.to_nat i) o1 inhabitant = (let n : Z := Z.of_nat (length o2) in if decide (i < n) then nth (Z.to_nat i) o2 inhabitant else nth (Z.to_nat (Z.of_nat (length o3) - 1%Z - (i - n))) o3 inhabitant))) ∧ (∀(result : t α), front result = o3 ∧ rear result = o2 ∧ seq result = o1 -> seq result = seq q).
Proof.
Admitted.
