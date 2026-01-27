import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import Why3.mach.c.C
open Classical
open Lean4Why3
namespace ccursor_PtrCursor_mainqtvc
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
theorem main'vc : (0 : ℤ) < (4 : ℤ) ∧ (∀(c : cursor), len c = (4 : BitVec 32) ∧ ¬freed c = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → BitVec.toInt ((C.data (current c))[Int.toNat i]!) = (0 : ℤ)) ∧ bound c = (4 : BitVec 32) → ((0 : ℤ) ≤ (255 : ℤ) + (1 : ℤ) → (¬freed c = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (len c) → BitVec.toInt ((C.data (current c))[Int.toNat i]!) < BitVec.toInt (bound c))) ∧ (∀(c1 : cursor) (c_new : Bool) (c_current : C.ptr (BitVec 32)), List.length (C.data c_current) = List.length (C.data (current c)) ∧ C.offset c_current = C.offset (current c) ∧ C.min c_current = C.min (current c) ∧ C.max c_current = C.max (current c) ∧ C.writable c_current = C.writable (current c) ∧ C.zone1 c_current = C.zone1 (current c) → (∀(i : BitVec 32), let i1 : ℤ := BitVec.toInt i; ((0 : ℤ) ≤ i1 ∧ i1 ≤ (255 : ℤ)) ∧ ¬freed c = true ∧ (∀(i2 : ℤ), (0 : ℤ) ≤ i2 ∧ i2 < BitVec.toInt (len c) → BitVec.toInt ((C.data c_current)[Int.toNat i2]!) < BitVec.toInt (bound c)) → c_new = true → ((0 : ℤ) < BitVec.toInt (len c) ∧ (¬freed c = true → C.plength c_current = BitVec.toInt (len c) ∧ C.offset c_current = (0 : ℤ) ∧ C.valid c_current (BitVec.toInt (len c)) ∧ C.min c_current = (0 : ℤ) ∧ C.max c_current = BitVec.toInt (len c) ∧ C.is_not_null c_current ∧ C.writable c_current = true ∧ (∀(i2 : ℤ), (0 : ℤ) ≤ i2 ∧ i2 < BitVec.toInt (len c) → BitVec.toInt ((C.data c_current)[Int.toNat i2]!) < BitVec.toInt (bound c)))) ∧ (bound c = bound c1 ∧ freed c = freed c1 ∧ len c = len c1 ∧ c_new = new c1 ∧ c_current = current c1 → (¬freed c1 = true ∧ (0 : ℤ) < BitVec.toInt (bound c1) ∧ BitVec.toInt (bound c1) < (2147483647 : ℤ)) ∧ (∀(c2 : cursor), List.length (C.data (current c2)) = List.length (C.data (current c1)) ∧ C.offset (current c2) = C.offset (current c1) ∧ C.min (current c2) = C.min (current c1) ∧ C.max (current c2) = C.max (current c1) ∧ C.writable (current c2) = C.writable (current c1) ∧ C.zone1 (current c2) = C.zone1 (current c1) → bound c1 = bound c2 ∧ freed c1 = freed c2 ∧ len c1 = len c2 → ¬freed c2 = true ∧ (∀(i2 : ℤ), (0 : ℤ) ≤ i2 ∧ i2 < BitVec.toInt (len c2) → BitVec.toInt ((C.data (current c2))[Int.toNat i2]!) < BitVec.toInt (bound c2))))) ∧ (¬freed c = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (len c) → BitVec.toInt ((C.data c_current)[Int.toNat i]!) < BitVec.toInt (bound c)) → ¬c_new = true → ((0 : ℤ) < BitVec.toInt (len c) ∧ (¬freed c = true → C.plength c_current = BitVec.toInt (len c) ∧ C.offset c_current = (0 : ℤ) ∧ C.valid c_current (BitVec.toInt (len c)) ∧ C.min c_current = (0 : ℤ) ∧ C.max c_current = BitVec.toInt (len c) ∧ C.is_not_null c_current ∧ C.writable c_current = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (len c) → BitVec.toInt ((C.data c_current)[Int.toNat i]!) < BitVec.toInt (bound c)))) ∧ (bound c = bound c1 ∧ freed c = freed c1 ∧ len c = len c1 ∧ c_new = new c1 ∧ c_current = current c1 → ¬freed c1 = true)))) ∧ ((255 : ℤ) + (1 : ℤ) < (0 : ℤ) → ¬new c = true → ¬freed c = true))
  := sorry
end ccursor_PtrCursor_mainqtvc
