import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Hackers_delight_dM7qtvc
noncomputable def validAscii (b : BitVec 32) := (Utils.count b)[BitVec.toNat (0 : BitVec 32)]! = false
noncomputable def toGray (bv : BitVec 32) := bv ^^^ (bv >>> BitVec.toNat (1 : BitVec 32))
noncomputable def fromGray (gr : BitVec 32) := let b : BitVec 32 := gr ^^^ (gr >>> BitVec.toNat (1 : BitVec 32)); let b1 : BitVec 32 := b ^^^ (b >>> BitVec.toNat (2 : BitVec 32)); let b2 : BitVec 32 := b1 ^^^ (b1 >>> BitVec.toNat (4 : BitVec 32)); let b3 : BitVec 32 := b2 ^^^ (b2 >>> BitVec.toNat (8 : BitVec 32)); b3 ^^^ (b3 >>> BitVec.toNat (16 : BitVec 32))
theorem dM7'vc (x : BitVec 32) (y : BitVec 32) : ~~~(x + y) = ~~~x - y
  := sorry
end hackers_delight_Hackers_delight_dM7qtvc
