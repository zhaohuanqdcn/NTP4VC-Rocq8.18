import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Hackers_delight_asciiqtvc
noncomputable def validAscii (b : BitVec 32) := (Utils.count b)[BitVec.toNat (0 : BitVec 32)]! = false
theorem ascii'vc (b : BitVec 32) (fact0 : ¬b[BitVec.toNat (31 : BitVec 32)]! = true) : validAscii (b ||| (Utils.count b <<< BitVec.toNat (31 : BitVec 32)))
  := sorry
end hackers_delight_Hackers_delight_asciiqtvc
