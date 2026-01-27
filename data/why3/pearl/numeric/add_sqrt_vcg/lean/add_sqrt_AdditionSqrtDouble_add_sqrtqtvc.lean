import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace add_sqrt_AdditionSqrtDouble_add_sqrtqtvc
axiom usqrt : UDouble.udouble -> UDouble.udouble
theorem add_sqrt'vc (a : UDouble.udouble) (b : UDouble.udouble) : let exact : ℝ := UDouble.to_real a + UDouble.to_real (usqrt b); abs (UDouble.to_real (UDouble.uadd a (usqrt b)) - exact) ≤ UDouble.eps * abs exact
  := sorry
end add_sqrt_AdditionSqrtDouble_add_sqrtqtvc
