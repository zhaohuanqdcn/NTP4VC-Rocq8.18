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
Axiom queue : Type -> Type.
Axiom queue_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (queue α).
Global Existing Instance queue_inhabited.
Axiom front : forall {α : Type} `{Inhabited α}, queue α -> list α.
Axiom lenf : forall {α : Type} `{Inhabited α}, queue α -> Z.
Axiom rear : forall {α : Type} `{Inhabited α}, queue α -> list α.
Axiom lenr : forall {α : Type} `{Inhabited α}, queue α -> Z.
Axiom queue'invariant : forall  {α : Type} `{Inhabited α} (self : queue α), Z.of_nat (length (front self)) = lenf self ∧ Z.of_nat (length (rear self)) ≤ lenf self ∧ Z.of_nat (length (rear self)) = lenr self.
Definition queue'eq {α : Type} `{Inhabited α} (a : queue α) (b : queue α) := front a = front b ∧ lenf a = lenf b ∧ rear a = rear b ∧ lenr a = lenr b.
Axiom queue'inj : forall  {α : Type} `{Inhabited α} (a : queue α) (b : queue α) (fact0 : queue'eq a b), a = b.
Definition sequence {α : Type} `{Inhabited α} (q : queue α) : list α := front q ++ rev (rear q).
Axiom empty : forall {α : Type} `{Inhabited α}, queue α.
Axiom empty'def : forall  {α : Type} `{Inhabited α}, sequence (empty : queue α) = ([] : list α).
Theorem enqueue'vc {α : Type} `{Inhabited α} (x : α) (q : queue α) : let o1 : list α := cons x (rear q) in let o2 : list α := front q in (lenf q = Z.of_nat (length o2) ∧ lenr q + 1%Z = Z.of_nat (length o1)) ∧ (∀(result : queue α), sequence result = o2 ++ rev o1 -> sequence result = sequence q ++ cons x ([] : list α)).
Admitted.
