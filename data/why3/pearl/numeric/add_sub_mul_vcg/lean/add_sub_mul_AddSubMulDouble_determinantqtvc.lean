import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace add_sub_mul_AddSubMulDouble_determinantqtvc
theorem determinant'vc (a : UDouble.udouble) (d : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) : let t1 : ℝ := UDouble.to_real a * UDouble.to_real d; let t2 : ℝ := UDouble.to_real b * UDouble.to_real c; abs (UDouble.to_real (UDouble.usub (UDouble.umul a d) (UDouble.umul b c)) - (t1 - t2)) ≤ (3 : ℝ) * UDouble.eps * (abs t1 + abs t2) + (2 : ℝ) * UDouble.eta * ((1 : ℝ) + (2 : ℝ) * UDouble.eps)
  := sorry
end add_sub_mul_AddSubMulDouble_determinantqtvc
