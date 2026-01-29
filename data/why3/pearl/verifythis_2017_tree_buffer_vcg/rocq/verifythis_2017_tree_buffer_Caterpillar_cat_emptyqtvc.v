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
Require Import verifythis_2017_tree_buffer_vcg.verifythis_2017_tree_buffer.Spec.
Open Scope Z_scope.
Axiom cat : Type -> Type.
Axiom cat_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (cat α).
Global Existing Instance cat_inhabited.
Axiom ch : forall {α : Type} `{Inhabited α}, cat α -> Z.
Axiom xs : forall {α : Type} `{Inhabited α}, cat α -> list α.
Axiom xs_len : forall {α : Type} `{Inhabited α}, cat α -> Z.
Axiom ys : forall {α : Type} `{Inhabited α}, cat α -> list α.
Axiom b : forall {α : Type} `{Inhabited α}, cat α -> buf α.
Axiom cat'invariant : forall  {α : Type} `{Inhabited α} (self : cat α), h (b self) = ch self ∧ xs_len self = Z.of_nat (length (xs self)) ∧ Z.of_nat (length (xs self)) < ch self ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ ch self -> Spec.take len (xs self ++ ys self) = Spec.take len (Spec.xs (b self))).
Definition cat'eq {α : Type} `{Inhabited α} (a : cat α) (b1 : cat α) := ch a = ch b1 ∧ xs a = xs b1 ∧ xs_len a = xs_len b1 ∧ ys a = ys b1 ∧ b a = b b1.
Axiom cat'inj : forall  {α : Type} `{Inhabited α} (a : cat α) (b1 : cat α) (fact0 : cat'eq a b1), a = b1.
Theorem cat_empty'vc {α : Type} `{Inhabited α} (h : Z) (fact0 : 0%Z < h) : let o1 : buf α := buf'mk h ([] : list α) in let o2 : list α := ([] : list α) in let o3 : list α := ([] : list α) in (Spec.h o1 = h ∧ (0%Z = Z.of_nat (length o3) ∧ Z.of_nat (length o3) < h) ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ h -> Spec.take len (o3 ++ o2) = Spec.take len (Spec.xs o1))) ∧ (∀(result : cat α), ch result = h ∧ xs result = o3 ∧ xs_len result = 0%Z ∧ ys result = o2 ∧ b result = o1 -> b result = buf'mk h ([] : list α)).
Proof.
Admitted.
