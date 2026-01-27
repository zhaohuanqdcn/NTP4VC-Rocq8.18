import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace add_sqrt_AdditionSqrtSingle_add_sqrtqtvc
axiom usqrt : USingle.usingle -> USingle.usingle
theorem add_sqrt'vc (a : USingle.usingle) (b : USingle.usingle) : let exact : ℝ := USingle.to_real a + USingle.to_real (usqrt b); abs (USingle.to_real (USingle.uadd a (usqrt b)) - exact) ≤ USingle.eps * abs exact
  := sorry
end add_sqrt_AdditionSqrtSingle_add_sqrtqtvc
