import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import Why3.mach.c.C
open Classical
open Lean4Why3
namespace PtrCursor
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
end PtrCursor
