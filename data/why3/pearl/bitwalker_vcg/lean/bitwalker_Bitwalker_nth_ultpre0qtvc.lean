import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.mach.bv.BVCheck8
import Why3.mach.bv.BVCheck32
import Why3.mach.bv.BVCheck64
open Classical
open Lean4Why3
namespace bitwalker_Bitwalker_nth_ultpre0qtvc
noncomputable def nth8_stream (stream : List (BitVec 8)) (pos : ℤ) := (stream[Int.toNat (pos / (8 : ℤ))]!)[Int.toNat ((7 : ℤ) - pos % (8 : ℤ))]!
noncomputable def maxvalue (len : BitVec 32) := (1 : BitVec 64) <<< BitVec.toNat (BitVec.zeroExtend 64 len)
theorem nth_ultpre0'vc (len : BitVec 32) (x : BitVec 64) (fact0 : BitVec.toUInt len < (64 : ℤ)) : BitVec.eq_sub x (0 : BitVec 64) (Int.toNat (BitVec.toUInt len)) (Int.toNat ((64 : ℤ) - BitVec.toUInt len)) = (BitVec.toUInt x < BitVec.toUInt (maxvalue len))
  := sorry
end bitwalker_Bitwalker_nth_ultpre0qtvc
