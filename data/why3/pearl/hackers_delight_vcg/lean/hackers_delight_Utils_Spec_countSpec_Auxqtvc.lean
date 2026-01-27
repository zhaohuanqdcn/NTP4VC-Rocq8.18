import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Utils_Spec_countSpec_Auxqtvc
axiom nth_closure : BitVec 32 -> ℤ -> Bool
axiom nth_closure_def (y : BitVec 32) (y1 : ℤ) : nth_closure y y1 = y[Int.toNat y1]!
theorem countSpec_Aux'vc (bv : BitVec 32) : BitVec.toUInt (Utils.count bv) = NumOf.numof (nth_closure bv) (0 : ℤ) (32 : ℤ)
  := sorry
end hackers_delight_Utils_Spec_countSpec_Auxqtvc
