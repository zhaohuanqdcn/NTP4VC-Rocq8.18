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
Axiom buffer : Type -> Type.
Axiom buffer_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (buffer α).
Global Existing Instance buffer_inhabited.
Axiom first : forall {α : Type} `{Inhabited α}, buffer α -> Z.
Axiom len : forall {α : Type} `{Inhabited α}, buffer α -> Z.
Axiom data : forall {α : Type} `{Inhabited α}, buffer α -> list α.
Axiom sequence : forall {α : Type} `{Inhabited α}, buffer α -> list α.
Axiom buffer'invariant : forall  {α : Type} `{Inhabited α} (self : buffer α), (0%Z ≤ first self ∧ first self < Z.of_nat (length (data self))) ∧ (0%Z ≤ len self ∧ len self ≤ Z.of_nat (length (data self))) ∧ len self = Z.of_nat (length (sequence self)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len self -> (first self + i < Z.of_nat (length (data self)) -> nth_error_i (sequence self) i = Some (nth (Z.to_nat (first self + i)) (data self) inhabitant)) ∧ (0%Z ≤ first self + i - Z.of_nat (length (data self)) -> nth_error_i (sequence self) i = Some (nth (Z.to_nat (first self + i - Z.of_nat (length (data self)))) (data self) inhabitant))).
Definition buffer'eq {α : Type} `{Inhabited α} (a : buffer α) (b : buffer α) := first a = first b ∧ len a = len b ∧ data a = data b ∧ sequence a = sequence b.
Axiom buffer'inj : forall  {α : Type} `{Inhabited α} (a : buffer α) (b : buffer α) (fact0 : buffer'eq a b), a = b.
Definition size {α : Type} `{Inhabited α} (b : buffer α) : Z := Z.of_nat (length (data b)).
Theorem pop'vc {α : Type} `{Inhabited α} (b : buffer α) (fact0 : 0%Z < len b) : match sequence b with | [] => False | cons _ s => (0%Z ≤ first b ∧ first b < Z.of_nat (length (data b))) ∧ (let r : α := nth (Z.to_nat (first b)) (data b) inhabitant in ∀(b1 : buffer α), if decide (first b + 1%Z = Z.of_nat (length (data b))) then ∀(b2 : buffer α), (let size1 : Z := Z.of_nat (length (data b)) in (0%Z ≤ 0%Z ∧ 0%Z < size1) ∧ (0%Z ≤ len b - 1%Z ∧ len b - 1%Z ≤ size1) ∧ len b - 1%Z = Z.of_nat (length s) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len b - 1%Z -> (0%Z + i < size1 -> nth_error_i s i = Some (nth (Z.to_nat (0%Z + i)) (data b) inhabitant)) ∧ (0%Z ≤ 0%Z + i - size1 -> nth_error_i s i = Some (nth (Z.to_nat (0%Z + i - size1)) (data b) inhabitant)))) ∧ (s = sequence b2 ∧ data b = data b2 ∧ len b - 1%Z = len b2 ∧ 0%Z = first b2 -> len b2 = len b - 1%Z ∧ (match sequence b with | [] => False | cons x l => r = x ∧ sequence b2 = l end)) else (let size1 : Z := Z.of_nat (length (data b)) in (0%Z ≤ first b + 1%Z ∧ first b + 1%Z < size1) ∧ (0%Z ≤ len b - 1%Z ∧ len b - 1%Z ≤ size1) ∧ len b - 1%Z = Z.of_nat (length s) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len b - 1%Z -> (first b + 1%Z + i < size1 -> nth_error_i s i = Some (nth (Z.to_nat (first b + 1%Z + i)) (data b) inhabitant)) ∧ (0%Z ≤ first b + 1%Z + i - size1 -> nth_error_i s i = Some (nth (Z.to_nat (first b + 1%Z + i - size1)) (data b) inhabitant)))) ∧ (s = sequence b1 ∧ data b = data b1 ∧ len b - 1%Z = len b1 ∧ first b + 1%Z = first b1 -> len b1 = len b - 1%Z ∧ (match sequence b with | [] => False | cons x l => r = x ∧ sequence b1 = l end))) end.
Admitted.
