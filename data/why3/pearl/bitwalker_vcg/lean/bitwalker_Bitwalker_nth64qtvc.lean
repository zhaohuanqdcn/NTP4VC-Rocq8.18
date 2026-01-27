import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_nth64qtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
theorem nth64'vc (i : ℤ) (value : BitVec 64) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (64 : ℤ)) : value[Int.toNat i]! = value[BitVec.toNat (BitVec.zeroExtend 64 (BitVec.ofInt 32 i))]!
  := sorry
end bitwalker_Bitwalker_nth64qtvc
