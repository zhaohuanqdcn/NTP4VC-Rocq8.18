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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Open Scope Z_scope.
Axiom cursor : Type.
Axiom cursor_inhabited : Inhabited cursor.
Global Existing Instance cursor_inhabited.
Axiom cursor_countable : Countable cursor.
Global Existing Instance cursor_countable.
Axiom current : cursor -> ptr (bv 32%N).
Axiom new : cursor -> bool.
Axiom len : cursor -> bv 32%N.
Axiom freed : cursor -> bool.
Axiom bound : cursor -> bv 32%N.
Axiom cursor'invariant : forall  (self : cursor), 0%Z < bv_signed (len self) ∧ (¬ freed self = true -> plength (current self) = bv_signed (len self) ∧ offset (current self) = 0%Z ∧ valid (current self) (bv_signed (len self)) ∧ min (current self) = 0%Z ∧ C.max (current self) = bv_signed (len self) ∧ is_not_null (current self) ∧ writable (current self) = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len self) -> bv_signed (nth (Z.to_nat i) (data (current self)) inhabitant) < bv_signed (bound self))).
Definition cursor'eq (a : cursor) (b : cursor) := current a = current b ∧ new a = new b ∧ len a = len b ∧ freed a = freed b ∧ bound a = bound b.
Axiom cursor'inj : forall  (a : cursor) (b : cursor) (fact0 : cursor'eq a b), a = b.
Theorem free_cursor'vc (c : cursor) (fact0 : ¬ freed c = true) : let o1 : ptr (bv 32%N) := current c in (offset o1 = 0%Z ∧ min o1 = 0%Z ∧ C.max o1 = plength o1 ∧ writable o1 = true) ∧ (∀(c_current : ptr (bv 32%N)), offset c_current = offset (current c) ∧ writable c_current = writable (current c) ∧ zone1 c_current = zone1 (current c) -> (∀(c1 : cursor), (0%Z < bv_signed (len c) ∧ (¬ True -> plength c_current = bv_signed (len c) ∧ offset c_current = 0%Z ∧ valid c_current (bv_signed (len c)) ∧ min c_current = 0%Z ∧ C.max c_current = bv_signed (len c) ∧ is_not_null c_current ∧ writable c_current = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len c) -> bv_signed (nth (Z.to_nat i) (data c_current) inhabitant) < bv_signed (bound c)))) ∧ (bound c = bound c1 ∧ true = freed c1 ∧ len c = len c1 ∧ new c = new c1 ∧ c_current = current c1 -> freed c1 = true))).
Proof.
Admitted.
