import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_peek_64bitqtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem peek_64bit'vc (left1 : BitVec 32) (value : BitVec 64) (fact0 : BitVec.toUInt left1 < (64 : ℤ)) : (BitVec.toUInt left1 ≤ (63 : ℤ) ∨ (63 : BitVec 32) ≥ left1) ∧ (let o1 : BitVec 32 := (63 : BitVec 32) - left1; BitVec.toUInt o1 = (63 : ℤ) - BitVec.toUInt left1 → (if value &&& ((1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 o1)) = (0 : BitVec 64) then false else true) = value[BitVec.toNat ((63 : BitVec 64) - BitVec.zeroExtend 64 left1)]!) ∧ value[BitVec.toNat ((63 : BitVec 64) - BitVec.zeroExtend 64 left1)]! = value[Int.toNat ((63 : ℤ) - BitVec.toUInt left1)]!
  := sorry
end bitwalker_Bitwalker_peek_64bitqtvc
