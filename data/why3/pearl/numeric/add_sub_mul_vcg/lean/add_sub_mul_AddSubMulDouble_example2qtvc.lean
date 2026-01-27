import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace add_sub_mul_AddSubMulDouble_example2qtvc
theorem example2'vc (a : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) : let t : ℝ := (1 : ℝ) + UDouble.eps; let t1 : ℝ := UDouble.eps + UDouble.eps * t; let t2 : ℝ := (UDouble.to_real a + UDouble.to_real b) * UDouble.to_real c; let t3 : ℝ := abs t2; let t4 : ℝ := (t + t1) * UDouble.eta; abs (UDouble.to_real (UDouble.uadd (UDouble.umul (UDouble.uadd a b) c) (UDouble.umul (UDouble.uadd a b) c)) - (t2 + t2)) ≤ (t1 + t1 + UDouble.eps) * (t3 + t3) + (t4 + t4)
  := sorry
end add_sub_mul_AddSubMulDouble_example2qtvc
