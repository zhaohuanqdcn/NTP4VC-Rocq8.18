import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Utils_Spec_symmetricqtvc
noncomputable def nth_diff (a : BitVec 32) (b : BitVec 32) (i : ℤ) := ¬a[Int.toNat i]! = b[Int.toNat i]!
theorem symmetric'vc (a : BitVec 32) (b : BitVec 32) : Utils.hammingD a b = Utils.hammingD b a
  := sorry
end hackers_delight_Utils_Spec_symmetricqtvc
