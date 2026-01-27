import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_peek_8bit_arrayqtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem peek_8bit_array'vc (addr : List (BitVec 8)) (left1 : BitVec 32) (fact0 : (8 : ℤ) * Int.ofNat (List.length addr) < (4294967296 : ℤ)) (fact1 : BitVec.toUInt left1 < (8 : ℤ) * Int.ofNat (List.length addr)) : (¬(8 : BitVec 32) = (0 : BitVec 32) ∨ ¬(8 : ℤ) = (0 : ℤ)) ∧ (BitVec.toUInt (left1 % (8 : BitVec 32)) = BitVec.toUInt left1 % (8 : ℤ) → (¬(8 : BitVec 32) = (0 : BitVec 32) ∨ ¬(8 : ℤ) = (0 : ℤ)) ∧ (BitVec.toUInt (left1 / (8 : BitVec 32)) = BitVec.toUInt left1 / (8 : ℤ) → (let o1 : ℤ := BitVec.toUInt (left1 / (8 : BitVec 32)); ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length addr)) ∧ ((0 : ℤ) ≤ BitVec.toUInt (left1 % (8 : BitVec 32)) ∧ BitVec.toUInt (left1 % (8 : BitVec 32)) < (8 : ℤ)) ∧ (addr[Int.toNat o1]!)[Int.toNat ((7 : ℤ) - BitVec.toUInt (left1 % (8 : BitVec 32)))]! = nth8_stream addr (BitVec.toUInt left1))))
  := sorry
end bitwalker_Bitwalker_peek_8bit_arrayqtvc
