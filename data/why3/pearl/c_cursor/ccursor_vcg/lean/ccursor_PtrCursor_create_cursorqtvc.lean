import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import Why3.mach.c.C
open Classical
open Lean4Why3
namespace ccursor_PtrCursor_create_cursorqtvc
axiom cursor : Type
axiom inhabited_axiom_cursor : Inhabited cursor
attribute [instance] inhabited_axiom_cursor
axiom current : cursor -> C.ptr (BitVec 32)
axiom new : cursor -> Bool
axiom len : cursor -> BitVec 32
axiom freed : cursor -> Bool
axiom bound : cursor -> BitVec 32
axiom cursor'invariant (self : cursor) : (0 : ℤ) < BitVec.toInt (len self) ∧ (¬freed self = true → C.plength (current self) = BitVec.toInt (len self) ∧ C.offset (current self) = (0 : ℤ) ∧ C.valid (current self) (BitVec.toInt (len self)) ∧ C.min (current self) = (0 : ℤ) ∧ C.max (current self) = BitVec.toInt (len self) ∧ C.is_not_null (current self) ∧ C.writable (current self) = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (len self) → BitVec.toInt ((C.data (current self))[Int.toNat i]!) < BitVec.toInt (bound self)))
noncomputable def cursor'eq (a : cursor) (b : cursor) := current a = current b ∧ new a = new b ∧ len a = len b ∧ freed a = freed b ∧ bound a = bound b
axiom cursor'inj (a : cursor) (b : cursor) (fact0 : cursor'eq a b) : a = b
theorem create_cursor'vc (l : BitVec 32) (b : BitVec 32) (fact0 : (0 : ℤ) < BitVec.toInt l) (fact1 : (0 : ℤ) < BitVec.toInt b) : (0 : ℤ) ≤ BitVec.toInt l ∧ (∀(o1 : BitVec 32), BitVec.toUInt o1 = BitVec.toInt l → (0 : ℤ) ≤ BitVec.toUInt o1 ∧ (∀(a : C.ptr (BitVec 32)), (¬C.zone1 a = C.null_zone → C.plength a = BitVec.toUInt o1) ∧ C.offset a = (0 : ℤ) ∧ C.min a = (0 : ℤ) ∧ C.max a = C.plength a ∧ C.writable a = true → C.is_not_null a = (¬C.zone1 a = C.null_zone) → C.is_not_null a → int'32_in_bounds (BitVec.toInt l - (1 : ℤ)) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt l - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o2 + (1 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → BitVec.toInt ((C.data a)[Int.toNat j]!) = (0 : ℤ)) ∧ (∀(a1 : C.ptr (BitVec 32)), List.length (C.data a1) = List.length (C.data a) ∧ C.offset a1 = C.offset a ∧ C.min a1 = C.min a ∧ C.max a1 = C.max a ∧ C.writable a1 = C.writable a ∧ C.zone1 a1 = C.zone1 a → (∀(i : BitVec 32), let i1 : ℤ := BitVec.toInt i; ((0 : ℤ) ≤ i1 ∧ i1 ≤ BitVec.toInt o2) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i1 → BitVec.toInt ((C.data a1)[Int.toNat j]!) = (0 : ℤ)) → ((C.min a1 ≤ C.offset a1 + BitVec.toInt i ∧ C.offset a1 + BitVec.toInt i < C.max a1) ∧ C.writable a1 = true) ∧ (∀(a2 : C.ptr (BitVec 32)), List.length (C.data a2) = List.length (C.data a1) ∧ C.offset a2 = C.offset a1 ∧ C.min a2 = C.min a1 ∧ C.max a2 = C.max a1 ∧ C.writable a2 = C.writable a1 ∧ C.zone1 a2 = C.zone1 a1 → C.pelts a2 = Function.update (C.pelts a1) (C.offset a2 + BitVec.toInt i) (0 : BitVec 32) ∧ C.pelts a2 (C.offset a2 + BitVec.toInt i) = (0 : BitVec 32) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i1 + (1 : ℤ) → BitVec.toInt ((C.data a2)[Int.toNat j]!) = (0 : ℤ)))) ∧ ((∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < BitVec.toInt o2 + (1 : ℤ) → BitVec.toInt ((C.data a1)[Int.toNat j]!) = (0 : ℤ)) → ((0 : ℤ) < BitVec.toInt l ∧ C.plength a1 = BitVec.toInt l ∧ C.offset a1 = (0 : ℤ) ∧ C.valid a1 (BitVec.toInt l) ∧ C.min a1 = (0 : ℤ) ∧ C.max a1 = BitVec.toInt l ∧ C.is_not_null a1 ∧ C.writable a1 = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt l → BitVec.toInt ((C.data a1)[Int.toNat i]!) < BitVec.toInt b)) ∧ (∀(result : cursor), current result = a1 ∧ new result = true ∧ len result = l ∧ freed result = false ∧ bound result = b → len result = l ∧ ¬freed result = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt l → BitVec.toInt ((C.data (current result))[Int.toNat i]!) = (0 : ℤ)) ∧ bound result = b)))) ∧ (BitVec.toInt o2 + (1 : ℤ) < (0 : ℤ) → ((0 : ℤ) < BitVec.toInt l ∧ C.plength a = BitVec.toInt l ∧ C.offset a = (0 : ℤ) ∧ C.valid a (BitVec.toInt l) ∧ C.min a = (0 : ℤ) ∧ C.max a = BitVec.toInt l ∧ C.is_not_null a ∧ C.writable a = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt l → BitVec.toInt ((C.data a)[Int.toNat i]!) < BitVec.toInt b)) ∧ (∀(result : cursor), current result = a ∧ new result = true ∧ len result = l ∧ freed result = false ∧ bound result = b → len result = l ∧ ¬freed result = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt l → BitVec.toInt ((C.data (current result))[Int.toNat i]!) = (0 : ℤ)) ∧ bound result = b)))))
  := sorry
end ccursor_PtrCursor_create_cursorqtvc
