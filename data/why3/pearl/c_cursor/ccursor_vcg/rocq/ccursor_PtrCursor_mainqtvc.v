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
Theorem main'vc : 0%Z < 4%Z ∧ (∀(c : cursor), len c = (4%bv : bv 32%N) ∧ ¬ freed c = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> bv_signed (nth (Z.to_nat i) (data (current c)) inhabitant) = 0%Z) ∧ bound c = (4%bv : bv 32%N) -> (0%Z ≤ 255%Z + 1%Z -> (¬ freed c = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len c) -> bv_signed (nth (Z.to_nat i) (data (current c)) inhabitant) < bv_signed (bound c))) ∧ (∀(c1 : cursor) (c_new : bool) (c_current : ptr (bv 32%N)), length (data c_current) = length (data (current c)) ∧ offset c_current = offset (current c) ∧ min c_current = min (current c) ∧ C.max c_current = C.max (current c) ∧ writable c_current = writable (current c) ∧ zone1 c_current = zone1 (current c) -> (∀(i : bv 32%N), let i1 : Z := bv_signed i in (0%Z ≤ i1 ∧ i1 ≤ 255%Z) ∧ ¬ freed c = true ∧ (∀(i2 : Z), 0%Z ≤ i2 ∧ i2 < bv_signed (len c) -> bv_signed (nth (Z.to_nat i2) (data c_current) inhabitant) < bv_signed (bound c)) -> c_new = true -> (0%Z < bv_signed (len c) ∧ (¬ freed c = true -> plength c_current = bv_signed (len c) ∧ offset c_current = 0%Z ∧ valid c_current (bv_signed (len c)) ∧ min c_current = 0%Z ∧ C.max c_current = bv_signed (len c) ∧ is_not_null c_current ∧ writable c_current = true ∧ (∀(i2 : Z), 0%Z ≤ i2 ∧ i2 < bv_signed (len c) -> bv_signed (nth (Z.to_nat i2) (data c_current) inhabitant) < bv_signed (bound c)))) ∧ (bound c = bound c1 ∧ freed c = freed c1 ∧ len c = len c1 ∧ c_new = new c1 ∧ c_current = current c1 -> (¬ freed c1 = true ∧ 0%Z < bv_signed (bound c1) ∧ bv_signed (bound c1) < 2147483647%Z) ∧ (∀(c2 : cursor), length (data (current c2)) = length (data (current c1)) ∧ offset (current c2) = offset (current c1) ∧ min (current c2) = min (current c1) ∧ C.max (current c2) = C.max (current c1) ∧ writable (current c2) = writable (current c1) ∧ zone1 (current c2) = zone1 (current c1) -> bound c1 = bound c2 ∧ freed c1 = freed c2 ∧ len c1 = len c2 -> ¬ freed c2 = true ∧ (∀(i2 : Z), 0%Z ≤ i2 ∧ i2 < bv_signed (len c2) -> bv_signed (nth (Z.to_nat i2) (data (current c2)) inhabitant) < bv_signed (bound c2))))) ∧ (¬ freed c = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len c) -> bv_signed (nth (Z.to_nat i) (data c_current) inhabitant) < bv_signed (bound c)) -> ¬ c_new = true -> (0%Z < bv_signed (len c) ∧ (¬ freed c = true -> plength c_current = bv_signed (len c) ∧ offset c_current = 0%Z ∧ valid c_current (bv_signed (len c)) ∧ min c_current = 0%Z ∧ C.max c_current = bv_signed (len c) ∧ is_not_null c_current ∧ writable c_current = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len c) -> bv_signed (nth (Z.to_nat i) (data c_current) inhabitant) < bv_signed (bound c)))) ∧ (bound c = bound c1 ∧ freed c = freed c1 ∧ len c = len c1 ∧ c_new = new c1 ∧ c_current = current c1 -> ¬ freed c1 = true)))) ∧ (255%Z + 1%Z < 0%Z -> ¬ new c = true -> ¬ freed c = true)).
Admitted.
