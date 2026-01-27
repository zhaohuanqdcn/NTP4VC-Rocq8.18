import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_peek_8bit_bvqtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem peek_8bit_bv'vc (left1 : BitVec 32) (byte : BitVec 8) (fact0 : (0 : ℤ) ≤ BitVec.toUInt left1) (fact1 : BitVec.toUInt left1 < (8 : ℤ)) : (BitVec.toUInt left1 ≤ (7 : ℤ) ∨ (7 : BitVec 32) ≥ left1) ∧ (let o1 : BitVec 32 := (7 : BitVec 32) - left1; BitVec.toUInt o1 = (7 : ℤ) - BitVec.toUInt left1 → (if BitVec.zeroExtend 32 byte &&& ((1 : BitVec 32) <<< BitVec.toNat o1) = (0 : BitVec 32) then false else true) = byte[BitVec.toNat ((7 : BitVec 8) - BitVec.truncate 8 left1)]!) ∧ byte[BitVec.toNat ((7 : BitVec 8) - BitVec.truncate 8 left1)]! = byte[Int.toNat ((7 : ℤ) - BitVec.toUInt left1)]!
  := sorry
end bitwalker_Bitwalker_peek_8bit_bvqtvc
