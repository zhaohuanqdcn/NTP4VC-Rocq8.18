import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import Why3.mach.c.C
open Classical
open Lean4Why3
namespace ccursor_PtrCursor_free_cursorqtvc
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
theorem free_cursor'vc (c : cursor) (fact0 : ¬freed c = true) : let o1 : C.ptr (BitVec 32) := current c; (C.offset o1 = (0 : ℤ) ∧ C.min o1 = (0 : ℤ) ∧ C.max o1 = C.plength o1 ∧ C.writable o1 = true) ∧ (∀(c_current : C.ptr (BitVec 32)), C.offset c_current = C.offset (current c) ∧ C.writable c_current = C.writable (current c) ∧ C.zone1 c_current = C.zone1 (current c) → (∀(c1 : cursor), ((0 : ℤ) < BitVec.toInt (len c) ∧ (¬True → C.plength c_current = BitVec.toInt (len c) ∧ C.offset c_current = (0 : ℤ) ∧ C.valid c_current (BitVec.toInt (len c)) ∧ C.min c_current = (0 : ℤ) ∧ C.max c_current = BitVec.toInt (len c) ∧ C.is_not_null c_current ∧ C.writable c_current = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (len c) → BitVec.toInt ((C.data c_current)[Int.toNat i]!) < BitVec.toInt (bound c)))) ∧ (bound c = bound c1 ∧ true = freed c1 ∧ len c = len c1 ∧ new c = new c1 ∧ c_current = current c1 → freed c1 = true)))
  := sorry
end ccursor_PtrCursor_free_cursorqtvc
