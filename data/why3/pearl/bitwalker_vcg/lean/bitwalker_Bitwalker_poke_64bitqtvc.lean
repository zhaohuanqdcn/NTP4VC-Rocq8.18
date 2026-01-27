import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_poke_64bitqtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem poke_64bit'vc (left1 : ℤ) (flag : Bool) (value : BitVec 64) (fact0 : (0 : ℤ) ≤ left1) (fact1 : left1 < (64 : ℤ)) : let left_bv : BitVec 64 := BitVec.ofInt 64 left1; (let mask : BitVec 64 := (1 : BitVec 64) <<< BitVec.toNat (BitVec.ofInt 64 ((63 : ℤ) - left1)); (match flag with | true => True | false => True) ∧ (∀(result : BitVec 64), (match flag with | true => result = value ||| mask | false => result = value &&& ~~~mask) → (∀(i : BitVec 64), i ≤ (63 : BitVec 64) → ¬i = (63 : BitVec 64) - left_bv → result[BitVec.toNat i]! = value[BitVec.toNat i]!) ∧ flag = result[BitVec.toNat ((63 : BitVec 64) - left_bv)]!)) ∧ (∀(result : BitVec 64), (∀(i : BitVec 64), i ≤ (63 : BitVec 64) → ¬i = (63 : BitVec 64) - left_bv → result[BitVec.toNat i]! = value[BitVec.toNat i]!) ∧ flag = result[BitVec.toNat ((63 : BitVec 64) - left_bv)]! → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i < (64 : ℤ)) ∧ ¬i = (63 : ℤ) - left1 → result[Int.toNat i]! = value[Int.toNat i]!) ∧ flag = result[Int.toNat ((63 : ℤ) - left1)]!)
  := sorry
end bitwalker_Bitwalker_poke_64bitqtvc
