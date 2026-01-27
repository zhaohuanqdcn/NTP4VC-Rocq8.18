import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace add_sub_mul_AddSubMulDouble_square_normqtvc
theorem square_norm'vc (a : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) : let t1 : ℝ := UDouble.to_real a * UDouble.to_real a; let t2 : ℝ := UDouble.to_real b * UDouble.to_real b; let t3 : ℝ := UDouble.to_real c * UDouble.to_real c; abs (UDouble.to_real (UDouble.uadd (UDouble.uadd (UDouble.umul a a) (UDouble.umul b b)) (UDouble.umul c c)) - (t1 + t2 + t3)) ≤ (5 : ℝ) * UDouble.eps * (t1 + t2 + t3) + UDouble.eta * ((2 : ℝ) * ((1 : ℝ) + (2 : ℝ) * UDouble.eps) * ((1 : ℝ) + (2 : ℝ) * UDouble.eps) + (1 : ℝ) + (4 : ℝ) * UDouble.eps)
  := sorry
end add_sub_mul_AddSubMulDouble_square_normqtvc
