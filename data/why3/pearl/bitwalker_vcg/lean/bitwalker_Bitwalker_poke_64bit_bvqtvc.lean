import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_poke_64bit_bvqtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem poke_64bit_bv'vc (left1 : BitVec 32) (flag : Bool) (value : BitVec 64) (fact0 : BitVec.toUInt left1 < (64 : ℤ)) : (BitVec.toUInt left1 ≤ (63 : ℤ) ∨ (63 : BitVec 32) ≥ left1) ∧ (let o1 : BitVec 32 := (63 : BitVec 32) - left1; BitVec.toUInt o1 = (63 : ℤ) - BitVec.toUInt left1 → (let mask : BitVec 64 := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 o1); (match flag with | true => True | false => True) ∧ (∀(result : BitVec 64), (match flag with | true => result = value ||| mask | false => result = value &&& ~~~mask) → (∀(i : BitVec 32), ¬i = (63 : BitVec 32) - left1 → result[BitVec.toNat (BitVec.zeroExtend 64 i)]! = value[BitVec.toNat (BitVec.zeroExtend 64 i)]!) ∧ flag = result[BitVec.toNat (BitVec.zeroExtend 64 ((63 : BitVec 32) - left1))]!))) ∧ (∀(result : BitVec 64), (∀(i : BitVec 32), ¬i = (63 : BitVec 32) - left1 → result[BitVec.toNat (BitVec.zeroExtend 64 i)]! = value[BitVec.toNat (BitVec.zeroExtend 64 i)]!) ∧ flag = result[BitVec.toNat (BitVec.zeroExtend 64 ((63 : BitVec 32) - left1))]! → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i < (64 : ℤ)) ∧ ¬i = (63 : ℤ) - BitVec.toUInt left1 → result[Int.toNat i]! = value[Int.toNat i]!) ∧ flag = result[Int.toNat ((63 : ℤ) - BitVec.toUInt left1)]!)
  := sorry
end bitwalker_Bitwalker_poke_64bit_bvqtvc
