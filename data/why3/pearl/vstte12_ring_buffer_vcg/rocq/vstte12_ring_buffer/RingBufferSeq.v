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
Axiom buffer : Type -> Type.
Axiom buffer_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (buffer α).
Global Existing Instance buffer_inhabited.
Axiom first : forall {α : Type} `{Inhabited α}, buffer α -> Z.
Axiom len : forall {α : Type} `{Inhabited α}, buffer α -> Z.
Axiom data : forall {α : Type} `{Inhabited α}, buffer α -> list α.
Axiom sequence : forall {α : Type} `{Inhabited α}, buffer α -> list α.
Axiom buffer'invariant : forall  {α : Type} `{Inhabited α} (self : buffer α), (0%Z ≤ first self ∧ first self < Z.of_nat (length (data self))) ∧ (0%Z ≤ len self ∧ len self ≤ Z.of_nat (length (data self))) ∧ len self = Z.of_nat (length (sequence self)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len self -> (first self + i < Z.of_nat (length (data self)) -> nth (Z.to_nat i) (sequence self) inhabitant = nth (Z.to_nat (first self + i)) (data self) inhabitant) ∧ (0%Z ≤ first self + i - Z.of_nat (length (data self)) -> nth (Z.to_nat i) (sequence self) inhabitant = nth (Z.to_nat (first self + i - Z.of_nat (length (data self)))) (data self) inhabitant)).
Definition buffer'eq {α : Type} `{Inhabited α} (a : buffer α) (b : buffer α) := first a = first b ∧ len a = len b ∧ data a = data b ∧ sequence a = sequence b.
Axiom buffer'inj : forall  {α : Type} `{Inhabited α} (a : buffer α) (b : buffer α) (fact0 : buffer'eq a b), a = b.
Definition size {α : Type} `{Inhabited α} (b : buffer α) : Z := Z.of_nat (length (data b)).
