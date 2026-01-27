import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Hackers_delight_asciiPropqtvc
noncomputable def validAscii (b : BitVec 32) := (Utils.count b)[BitVec.toNat (0 : BitVec 32)]! = false
theorem asciiProp'vc (a : BitVec 32) (b : BitVec 32) : (validAscii a ∧ ¬validAscii b ∨ validAscii b ∧ ¬validAscii a) = ((Utils.hammingD a b)[BitVec.toNat (0 : BitVec 32)]! = true)
  := sorry
end hackers_delight_Hackers_delight_asciiPropqtvc
