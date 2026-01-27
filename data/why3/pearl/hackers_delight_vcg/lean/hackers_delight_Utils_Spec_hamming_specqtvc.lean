import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Utils_Spec_hamming_specqtvc
noncomputable def nth_diff (a : BitVec 32) (b : BitVec 32) (i : ℤ) := ¬a[Int.toNat i]! = b[Int.toNat i]!
axiom nth_diff_closure : BitVec 32 -> BitVec 32 -> ℤ -> Bool
axiom nth_diff_closure_def (y : BitVec 32) (y1 : BitVec 32) (y2 : ℤ) : (nth_diff_closure y y1 y2 = true) = nth_diff y y1 y2
theorem hamming_spec'vc (a : BitVec 32) (b : BitVec 32) : BitVec.toUInt (Utils.hammingD a b) = NumOf.numof (nth_diff_closure a b) (0 : ℤ) (32 : ℤ)
  := sorry
end hackers_delight_Utils_Spec_hamming_specqtvc
