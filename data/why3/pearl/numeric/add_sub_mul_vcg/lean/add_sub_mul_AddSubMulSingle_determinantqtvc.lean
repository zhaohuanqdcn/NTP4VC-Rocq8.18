import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace add_sub_mul_AddSubMulSingle_determinantqtvc
theorem determinant'vc (a : USingle.usingle) (d : USingle.usingle) (b : USingle.usingle) (c : USingle.usingle) : let t1 : ℝ := USingle.to_real a * USingle.to_real d; let t2 : ℝ := USingle.to_real b * USingle.to_real c; abs (USingle.to_real (USingle.usub (USingle.umul a d) (USingle.umul b c)) - (t1 - t2)) ≤ (3 : ℝ) * USingle.eps * (abs t1 + abs t2) + (2 : ℝ) * USingle.eta * ((1 : ℝ) + (2 : ℝ) * USingle.eps)
  := sorry
end add_sub_mul_AddSubMulSingle_determinantqtvc
