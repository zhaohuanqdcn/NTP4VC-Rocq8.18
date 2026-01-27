import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace add_sub_mul_AddSubMulSingle_square_normqtvc
theorem square_norm'vc (a : USingle.usingle) (b : USingle.usingle) (c : USingle.usingle) : let t1 : ℝ := USingle.to_real a * USingle.to_real a; let t2 : ℝ := USingle.to_real b * USingle.to_real b; let t3 : ℝ := USingle.to_real c * USingle.to_real c; abs (USingle.to_real (USingle.uadd (USingle.uadd (USingle.umul a a) (USingle.umul b b)) (USingle.umul c c)) - (t1 + t2 + t3)) ≤ (5 : ℝ) * USingle.eps * (t1 + t2 + t3) + USingle.eta * ((2 : ℝ) * ((1 : ℝ) + (2 : ℝ) * USingle.eps) * ((1 : ℝ) + (2 : ℝ) * USingle.eps) + (1 : ℝ) + (4 : ℝ) * USingle.eps)
  := sorry
end add_sub_mul_AddSubMulSingle_square_normqtvc
