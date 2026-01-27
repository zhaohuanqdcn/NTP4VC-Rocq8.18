import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Utils_Spec_numOfZeroqtvc
axiom nth_closure : BitVec 32 -> ℤ -> Bool
axiom nth_closure_def (y : BitVec 32) (y1 : ℤ) : nth_closure y y1 = y[Int.toNat y1]!
theorem numOfZero'vc : NumOf.numof (nth_closure (0 : BitVec 32)) (0 : ℤ) (32 : ℤ) = (0 : ℤ)
  := sorry
end hackers_delight_Utils_Spec_numOfZeroqtvc
