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
Theorem empty'vc {α : Type} `{Inhabited α} : let o1 : list α := ([] : list α) in let o2 : list α := ([] : list α) in (Z.of_nat (length o2) = 0%Z ∧ Z.of_nat (length o1) ≤ 0%Z ∧ Z.of_nat (length o1) = 0%Z) ∧ (∀(result : queue α), front result = o2 ∧ lenf result = 0%Z ∧ rear result = o1 ∧ lenr result = 0%Z -> sequence result = ([] : list α)).
Proof.
Admitted.
