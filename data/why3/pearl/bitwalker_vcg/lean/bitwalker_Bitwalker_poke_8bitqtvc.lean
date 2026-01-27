import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_poke_8bitqtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem poke_8bit'vc (left1 : BitVec 32) (flag : Bool) (byte : BitVec 8) (fact0 : BitVec.toUInt left1 < (8 : ℤ)) : (let o1 : BitVec 8 := BitVec.truncate 8 left1; (BitVec.toUInt o1 ≤ (7 : ℤ) ∨ (7 : BitVec 8) ≥ o1) ∧ (let o2 : BitVec 8 := (7 : BitVec 8) - o1; BitVec.toUInt o2 = (7 : ℤ) - BitVec.toUInt o1 → (let mask : BitVec 8 := (1 : BitVec 8) <<< BitVec.toNat o2; (match flag with | true => True | false => True) ∧ (∀(result : BitVec 8), (match flag with | true => result = byte ||| mask | false => result = byte &&& ~~~mask) → (∀(i : BitVec 32), i < (8 : BitVec 32) → ¬i = (7 : BitVec 32) - left1 → result[BitVec.toNat (BitVec.truncate 8 i)]! = byte[BitVec.toNat (BitVec.truncate 8 i)]!) ∧ result[BitVec.toNat ((7 : BitVec 8) - BitVec.truncate 8 left1)]! = flag)))) ∧ (∀(result : BitVec 8), (∀(i : BitVec 32), i < (8 : BitVec 32) → ¬i = (7 : BitVec 32) - left1 → result[BitVec.toNat (BitVec.truncate 8 i)]! = byte[BitVec.toNat (BitVec.truncate 8 i)]!) ∧ result[BitVec.toNat ((7 : BitVec 8) - BitVec.truncate 8 left1)]! = flag → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) → ¬i = (7 : ℤ) - BitVec.toUInt left1 → result[Int.toNat i]! = byte[Int.toNat i]!) ∧ result[Int.toNat ((7 : ℤ) - BitVec.toUInt left1)]! = flag)
  := sorry
end bitwalker_Bitwalker_poke_8bitqtvc
