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
Theorem create_cursor'vc (l : bv 32%N) (b : bv 32%N) (fact0 : 0%Z < bv_signed l) (fact1 : 0%Z < bv_signed b) : 0%Z ≤ bv_signed l ∧ (∀(o1 : bv 32%N), bv_unsigned o1 = bv_signed l -> 0%Z ≤ bv_unsigned o1 ∧ (∀(a : ptr (bv 32%N)), (¬ zone1 a = null_zone -> plength a = bv_unsigned o1) ∧ offset a = 0%Z ∧ min a = 0%Z ∧ C.max a = plength a ∧ writable a = true -> is_not_null a = (¬ zone1 a = null_zone) -> is_not_null a -> int'32_in_bounds (bv_signed l - 1%Z) ∧ (∀(o2 : bv 32%N), bv_signed o2 = bv_signed l - 1%Z -> (0%Z ≤ bv_signed o2 + 1%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> bv_signed (nth (Z.to_nat j) (data a) inhabitant) = 0%Z) ∧ (∀(a1 : ptr (bv 32%N)), length (data a1) = length (data a) ∧ offset a1 = offset a ∧ min a1 = min a ∧ C.max a1 = C.max a ∧ writable a1 = writable a ∧ zone1 a1 = zone1 a -> (∀(i : bv 32%N), let i1 : Z := bv_signed i in (0%Z ≤ i1 ∧ i1 ≤ bv_signed o2) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i1 -> bv_signed (nth (Z.to_nat j) (data a1) inhabitant) = 0%Z) -> ((min a1 ≤ offset a1 + bv_signed i ∧ offset a1 + bv_signed i < C.max a1) ∧ writable a1 = true) ∧ (∀(a2 : ptr (bv 32%N)), length (data a2) = length (data a1) ∧ offset a2 = offset a1 ∧ min a2 = min a1 ∧ C.max a2 = C.max a1 ∧ writable a2 = writable a1 ∧ zone1 a2 = zone1 a1 -> pelts a2 = fun_updt (pelts a1) (offset a2 + bv_signed i) (0%bv : bv 32%N) ∧ pelts a2 (offset a2 + bv_signed i) = (0%bv : bv 32%N) -> (∀(j : Z), 0%Z ≤ j ∧ j < i1 + 1%Z -> bv_signed (nth (Z.to_nat j) (data a2) inhabitant) = 0%Z))) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < bv_signed o2 + 1%Z -> bv_signed (nth (Z.to_nat j) (data a1) inhabitant) = 0%Z) -> (0%Z < bv_signed l ∧ plength a1 = bv_signed l ∧ offset a1 = 0%Z ∧ valid a1 (bv_signed l) ∧ min a1 = 0%Z ∧ C.max a1 = bv_signed l ∧ is_not_null a1 ∧ writable a1 = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed l -> bv_signed (nth (Z.to_nat i) (data a1) inhabitant) < bv_signed b)) ∧ (∀(result : cursor), current result = a1 ∧ new result = true ∧ len result = l ∧ freed result = false ∧ bound result = b -> len result = l ∧ ¬ freed result = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed l -> bv_signed (nth (Z.to_nat i) (data (current result)) inhabitant) = 0%Z) ∧ bound result = b)))) ∧ (bv_signed o2 + 1%Z < 0%Z -> (0%Z < bv_signed l ∧ plength a = bv_signed l ∧ offset a = 0%Z ∧ valid a (bv_signed l) ∧ min a = 0%Z ∧ C.max a = bv_signed l ∧ is_not_null a ∧ writable a = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed l -> bv_signed (nth (Z.to_nat i) (data a) inhabitant) < bv_signed b)) ∧ (∀(result : cursor), current result = a ∧ new result = true ∧ len result = l ∧ freed result = false ∧ bound result = b -> len result = l ∧ ¬ freed result = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed l -> bv_signed (nth (Z.to_nat i) (data (current result)) inhabitant) = 0%Z) ∧ bound result = b))))).
Proof.
Admitted.
