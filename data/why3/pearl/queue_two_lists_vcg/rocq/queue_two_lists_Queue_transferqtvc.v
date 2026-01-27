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
Theorem transfer'vc {α : Type} `{Inhabited α} (q2 : t α) (q11 : t α) : match rear q2 with | [] => (∀(q21 : t α) (q1 : t α), seq q1 = ([] : list α) -> (Z.of_nat (length (seq q11)) = Z.of_nat (length (front q11)) + Z.of_nat (length (rear q11)) ∧ (0%Z < Z.of_nat (length (front q11)) -> 0%Z < Z.of_nat (length (rear q11))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (seq q11)) -> nth (Z.to_nat i) (seq q11) inhabitant = (let n : Z := Z.of_nat (length (rear q11)) in if decide (i < n) then nth (Z.to_nat i) (rear q11) inhabitant else nth (Z.to_nat (Z.of_nat (length (front q11)) - 1%Z - (i - n))) (front q11) inhabitant))) ∧ (seq q11 = seq q21 ∧ rear q11 = rear q21 ∧ front q11 = front q21 -> seq q1 = ([] : list α) ∧ seq q21 = seq q2 ++ seq q11)) | _ => (let o1 : list α := seq q11 in let o2 : list α := seq q2 ++ o1 in Z.of_nat (length o2) = Z.of_nat (length (seq q2)) + Z.of_nat (length o1) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (seq q2)) -> nth (Z.to_nat i) o2 inhabitant = nth (Z.to_nat i) (seq q2) inhabitant) ∧ (∀(i : Z), Z.of_nat (length (seq q2)) ≤ i ∧ i < Z.of_nat (length o2) -> nth (Z.to_nat i) o2 inhabitant = nth (Z.to_nat (i - Z.of_nat (length (seq q2)))) o1 inhabitant) -> (∀(q21 : t α) (q1 : t α), seq q1 = ([] : list α) -> (Z.of_nat (length o2) = Z.of_nat (length (front q11 ++ rev (rear q11) ++ front q2)) + Z.of_nat (length (rear q2)) ∧ (0%Z < Z.of_nat (length (front q11 ++ rev (rear q11) ++ front q2)) -> 0%Z < Z.of_nat (length (rear q2))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o2) -> nth (Z.to_nat i) o2 inhabitant = (let n : Z := Z.of_nat (length (rear q2)) in if decide (i < n) then nth (Z.to_nat i) (rear q2) inhabitant else nth (Z.to_nat (Z.of_nat (length (front q11 ++ rev (rear q11) ++ front q2)) - 1%Z - (i - n))) (front q11 ++ rev (rear q11) ++ front q2) inhabitant))) ∧ (o2 = seq q21 ∧ rear q2 = rear q21 ∧ front q11 ++ rev (rear q11) ++ front q2 = front q21 -> seq q1 = ([] : list α) ∧ seq q21 = seq q2 ++ seq q11))) end.
Admitted.
