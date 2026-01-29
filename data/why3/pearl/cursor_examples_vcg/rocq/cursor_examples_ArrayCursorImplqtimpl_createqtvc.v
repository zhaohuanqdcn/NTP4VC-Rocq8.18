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
Theorem create'vc {α : Type} `{Inhabited α} (a : list α) : let o1 : list α := a in let o2 : list α := ([] : list α) in ((0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length o1)) ∧ 0%Z = Z.of_nat (length o2) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) o1 inhabitant = nth (Z.to_nat i) o2 inhabitant)) ∧ (∀(result : cursor α), visited result = o2 ∧ collection result = o1 ∧ index result = 0%Z -> visited result = ([] : list α) ∧ index result = 0%Z ∧ collection result = a).
Proof.
Admitted.
