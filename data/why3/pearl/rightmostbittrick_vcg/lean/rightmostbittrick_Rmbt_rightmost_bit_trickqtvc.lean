import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace rightmostbittrick_Rmbt_rightmost_bit_trickqtvc
theorem rightmost_bit_trick'vc (x : BitVec 64) (fact0 : ¬x = (0 : BitVec 64)) : ¬x = (0 : BitVec 64) ∧ (∀(p_bv : BitVec 64), p_bv < (64 : BitVec 64) ∧ BitVec.eq_sub x (0 : BitVec 64) (BitVec.toNat (0 : BitVec 64)) (BitVec.toNat p_bv) ∧ x[BitVec.toNat p_bv]! = true → (let r : BitVec 64 := x &&& -x; ((0 : ℤ) ≤ BitVec.toUInt p_bv ∧ BitVec.toUInt p_bv < (64 : ℤ)) ∧ BitVec.eq_sub x (0 : BitVec 64) (0 : ℕ) (Int.toNat (BitVec.toUInt p_bv)) ∧ x[Int.toNat (BitVec.toUInt p_bv)]! = true ∧ BitVec.eq_sub r (0 : BitVec 64) (0 : ℕ) (Int.toNat (BitVec.toUInt p_bv)) ∧ BitVec.eq_sub r (0 : BitVec 64) (Int.toNat (BitVec.toUInt p_bv + (1 : ℤ))) (Int.toNat ((63 : ℤ) - BitVec.toUInt p_bv)) ∧ r[Int.toNat (BitVec.toUInt p_bv)]! = true))
  := sorry
end rightmostbittrick_Rmbt_rightmost_bit_trickqtvc
