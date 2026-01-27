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
Axiom cursor : Type -> Type.
Axiom cursor_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (cursor α).
Global Existing Instance cursor_inhabited.
Axiom visited : forall {α : Type} `{Inhabited α}, cursor α -> list α.
Axiom collection : forall {α : Type} `{Inhabited α}, cursor α -> list α.
Axiom index : forall {α : Type} `{Inhabited α}, cursor α -> Z.
Axiom cursor'invariant : forall  {α : Type} `{Inhabited α} (self : cursor α), 0%Z ≤ index self ∧ index self ≤ Z.of_nat (length (collection self)) ∧ index self = Z.of_nat (length (visited self)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < index self -> nth (Z.to_nat i) (collection self) inhabitant = nth (Z.to_nat i) (visited self) inhabitant).
Definition cursor'eq {α : Type} `{Inhabited α} (a : cursor α) (b : cursor α) := visited a = visited b ∧ collection a = collection b ∧ index a = index b.
Axiom cursor'inj : forall  {α : Type} `{Inhabited α} (a : cursor α) (b : cursor α) (fact0 : cursor'eq a b), a = b.
Definition permitted {α : Type} `{Inhabited α} (c : cursor α) := Z.of_nat (length (visited c)) ≤ Z.of_nat (length (collection c)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (visited c)) -> nth (Z.to_nat i) (visited c) inhabitant = nth (Z.to_nat i) (collection c) inhabitant).
Definition complete {α : Type} `{Inhabited α} (c : cursor α) := length (visited c) = length (collection c).
Theorem next'vc {α : Type} `{Inhabited α} (c : cursor α) (fact0 : ¬ complete c) : ¬ Z.of_nat (length (collection c)) ≤ index c ∧ (let x : α := nth (Z.to_nat (index c)) (collection c) inhabitant in let o1 : list α := visited c in let o2 : list α := o1 ++ [x] in Z.of_nat (length o2) = 1%Z + Z.of_nat (length o1) ∧ nth (length o1) o2 inhabitant = x ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o1) -> nth (Z.to_nat i) o2 inhabitant = nth (Z.to_nat i) o1 inhabitant) -> (∀(c1 : cursor α), ((0%Z ≤ index c + 1%Z ∧ index c + 1%Z ≤ Z.of_nat (length (collection c))) ∧ index c + 1%Z = Z.of_nat (length o2) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < index c + 1%Z -> nth (Z.to_nat i) (collection c) inhabitant = nth (Z.to_nat i) o2 inhabitant)) ∧ (index c + 1%Z = index c1 ∧ collection c = collection c1 ∧ o2 = visited c1 -> visited c1 = visited c ++ [x] ∧ index c1 = index c + 1%Z))).
Admitted.
