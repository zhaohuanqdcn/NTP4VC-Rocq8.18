import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_poke_8bit_arrayqtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem poke_8bit_array'vc (addr : List (BitVec 8)) (left1 : BitVec 32) (flag : Bool) (fact0 : (8 : ℤ) * Int.ofNat (List.length addr) < (4294967296 : ℤ)) (fact1 : BitVec.toUInt left1 < (8 : ℤ) * Int.ofNat (List.length addr)) : (¬(8 : BitVec 32) = (0 : BitVec 32) ∨ ¬(8 : ℤ) = (0 : ℤ)) ∧ (BitVec.toUInt (left1 / (8 : BitVec 32)) = BitVec.toUInt left1 / (8 : ℤ) → (¬(8 : BitVec 32) = (0 : BitVec 32) ∨ ¬(8 : ℤ) = (0 : ℤ)) ∧ (BitVec.toUInt (left1 % (8 : BitVec 32)) = BitVec.toUInt left1 % (8 : ℤ) → (let o1 : ℤ := BitVec.toUInt (left1 / (8 : BitVec 32)); ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length addr)) ∧ BitVec.toUInt (left1 % (8 : BitVec 32)) < (8 : ℤ) ∧ (∀(o2 : BitVec 8), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) → ¬i = (7 : ℤ) - BitVec.toUInt (left1 % (8 : BitVec 32)) → o2[Int.toNat i]! = (addr[Int.toNat o1]!)[Int.toNat i]!) ∧ o2[Int.toNat ((7 : ℤ) - BitVec.toUInt (left1 % (8 : BitVec 32)))]! = flag → (let o3 : ℤ := BitVec.toUInt (left1 / (8 : BitVec 32)); ((0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length addr)) ∧ (List.length (List.set addr (Int.toNat o3) o2) = List.length addr → getElem! (List.set addr (Int.toNat o3) o2) ∘ Int.toNat = Function.update (getElem! addr ∘ Int.toNat) o3 o2 → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) * Int.ofNat (List.length (List.set addr (Int.toNat o3) o2)) → ¬i = BitVec.toUInt left1 → nth8_stream (List.set addr (Int.toNat o3) o2) i = nth8_stream addr i) ∧ nth8_stream (List.set addr (Int.toNat o3) o2) (BitVec.toUInt left1) = flag))))))
  := sorry
end bitwalker_Bitwalker_poke_8bit_arrayqtvc
