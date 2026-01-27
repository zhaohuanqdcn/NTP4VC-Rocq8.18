import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace add_sub_mul_AddSubMulSingle_example2qtvc
theorem example2'vc (a : USingle.usingle) (b : USingle.usingle) (c : USingle.usingle) : let t : ℝ := (1 : ℝ) + USingle.eps; let t1 : ℝ := USingle.eps + USingle.eps * t; let t2 : ℝ := (USingle.to_real a + USingle.to_real b) * USingle.to_real c; let t3 : ℝ := abs t2; let t4 : ℝ := (t + t1) * USingle.eta; abs (USingle.to_real (USingle.uadd (USingle.umul (USingle.uadd a b) c) (USingle.umul (USingle.uadd a b) c)) - (t2 + t2)) ≤ (t1 + t1 + USingle.eps) * (t3 + t3) + (t4 + t4)
  := sorry
end add_sub_mul_AddSubMulSingle_example2qtvc
