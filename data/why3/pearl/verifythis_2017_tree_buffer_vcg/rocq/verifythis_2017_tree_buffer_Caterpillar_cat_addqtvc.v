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
Theorem cat_add'vc {α : Type} `{Inhabited α} (c : cat α) (x : α) : let o1 : Z := ch c - 1%Z in let o2 : Z := xs_len c in (if decide (o2 = o1) then let o3 : buf α := add x (b c) in let o4 : list α := ([] : list α) in let o5 : Z := ch c in h o3 = o5 ∧ (0%Z = Z.of_nat (length o4) ∧ Z.of_nat (length o4) < o5) ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ o5 -> Spec.take len (o4 ++ cons x (xs c)) = Spec.take len (Spec.xs o3)) else let o3 : buf α := add x (b c) in let o4 : list α := cons x (xs c) in let o5 : Z := ch c in h o3 = o5 ∧ (1%Z + xs_len c = Z.of_nat (length o4) ∧ Z.of_nat (length o4) < o5) ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ o5 -> Spec.take len (o4 ++ ys c) = Spec.take len (Spec.xs o3))) ∧ (∀(result : cat α), (if decide (o2 = o1) then ch result = ch c ∧ xs result = ([] : list α) ∧ xs_len result = 0%Z ∧ ys result = cons x (xs c) ∧ b result = add x (b c) else ch result = ch c ∧ xs result = cons x (xs c) ∧ xs_len result = 1%Z + xs_len c ∧ ys result = ys c ∧ b result = add x (b c)) -> b result = add x (b c)).
Admitted.
