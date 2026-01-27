import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace rightmostbittrick_Rmbt_rightmost_position_setqtvc
theorem rightmost_position_set'vc (a : BitVec 64) (fact0 : ¬a = (0 : BitVec 64)) : BitVec.eq_sub a (0 : BitVec 64) (BitVec.toNat (0 : BitVec 64)) (BitVec.toNat (0 : BitVec 64)) ∧ (∀(i : BitVec 64), BitVec.eq_sub a (0 : BitVec 64) (BitVec.toNat (0 : BitVec 64)) (BitVec.toNat i) → (∀(o1 : Bool), (if i < (64 : BitVec 64) then o1 = (if a[BitVec.toNat i]! = true then false else true) else o1 = false) → (if o1 = true then ((0 : ℤ) ≤ (64 : ℤ) - BitVec.toUInt i ∧ (64 : ℤ) - BitVec.toUInt (i + (1 : BitVec 64)) < (64 : ℤ) - BitVec.toUInt i) ∧ BitVec.eq_sub a (0 : BitVec 64) (BitVec.toNat (0 : BitVec 64)) (BitVec.toNat (i + (1 : BitVec 64))) else i < (64 : BitVec 64) ∧ BitVec.eq_sub a (0 : BitVec 64) (BitVec.toNat (0 : BitVec 64)) (BitVec.toNat i) ∧ a[BitVec.toNat i]! = true)))
  := sorry
end rightmostbittrick_Rmbt_rightmost_position_setqtvc
