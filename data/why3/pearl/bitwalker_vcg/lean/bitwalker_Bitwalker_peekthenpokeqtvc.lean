import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_peekthenpokeqtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem peekthenpoke'vc (addr : List (BitVec 8)) (len : BitVec 32) (start : BitVec 32) (fact0 : (8 : ℤ) * Int.ofNat (List.length addr) < (4294967296 : ℤ)) (fact1 : (0 : ℤ) ≤ BitVec.toUInt len) (fact2 : BitVec.toUInt len < (64 : ℤ)) (fact3 : BitVec.toUInt start + BitVec.toUInt len ≤ (8 : ℤ) * Int.ofNat (List.length addr)) : BitVec.toUInt len ≤ (64 : ℤ) ∧ BitVec.toUInt start + BitVec.toUInt len < (4294967296 : ℤ) ∧ (8 : ℤ) * Int.ofNat (List.length addr) < (4294967296 : ℤ) ∧ (∀(value : BitVec 64), ((8 : ℤ) * Int.ofNat (List.length addr) < BitVec.toUInt start + BitVec.toUInt len → value = (0 : BitVec 64)) ∧ (BitVec.toUInt start + BitVec.toUInt len ≤ (8 : ℤ) * Int.ofNat (List.length addr) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toUInt len → value[Int.toNat i]! = nth8_stream addr (BitVec.toUInt start + BitVec.toUInt len - i - (1 : ℤ))) ∧ (∀(i : ℤ), BitVec.toUInt len ≤ i ∧ i < (64 : ℤ) → value[Int.toNat i]! = false)) → (BitVec.toUInt len < (64 : ℤ) ∧ BitVec.toUInt start + BitVec.toUInt len < (4294967296 : ℤ) ∧ (8 : ℤ) * Int.ofNat (List.length addr) < (4294967296 : ℤ)) ∧ (∀(addr1 : List (BitVec 8)), List.length addr1 = List.length addr → (∀(res : ℤ), (-(2 : ℤ) ≤ res ∧ res ≤ (0 : ℤ)) ∧ (res = -(1 : ℤ)) = ((8 : ℤ) * Int.ofNat (List.length addr1) < BitVec.toUInt start + BitVec.toUInt len) ∧ (res = -(2 : ℤ)) = (BitVec.toUInt (maxvalue len) ≤ BitVec.toUInt value ∧ BitVec.toUInt start + BitVec.toUInt len ≤ (8 : ℤ) * Int.ofNat (List.length addr1)) ∧ (res = (0 : ℤ)) = (BitVec.toUInt value < BitVec.toUInt (maxvalue len) ∧ BitVec.toUInt start + BitVec.toUInt len ≤ (8 : ℤ) * Int.ofNat (List.length addr1)) ∧ (res = (0 : ℤ) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toUInt start → nth8_stream addr i = nth8_stream addr1 i) ∧ (∀(i : ℤ), BitVec.toUInt start ≤ i ∧ i < BitVec.toUInt start + BitVec.toUInt len → nth8_stream addr1 i = value[Int.toNat (BitVec.toUInt len - i - (1 : ℤ) + BitVec.toUInt start)]!) ∧ (∀(i : ℤ), BitVec.toUInt start + BitVec.toUInt len ≤ i ∧ i < (8 : ℤ) * Int.ofNat (List.length addr1) → nth8_stream addr1 i = nth8_stream addr i)) → res = (0 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) * Int.ofNat (List.length addr1) → nth8_stream addr1 i = nth8_stream addr i))))
  := sorry
end bitwalker_Bitwalker_peekthenpokeqtvc
