import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Utils_Spec_countStepqtvc
theorem countStep'vc (b : BitVec 32) : (¬b[BitVec.toNat (0 : BitVec 32)]! = true) = (Utils.count (b >>> BitVec.toNat (1 : BitVec 32)) = Utils.count b) ∧ (b[BitVec.toNat (0 : BitVec 32)]! = true) = (Utils.count (b >>> BitVec.toNat (1 : BitVec 32)) = Utils.count b - (1 : BitVec 32))
  := sorry
end hackers_delight_Utils_Spec_countStepqtvc
