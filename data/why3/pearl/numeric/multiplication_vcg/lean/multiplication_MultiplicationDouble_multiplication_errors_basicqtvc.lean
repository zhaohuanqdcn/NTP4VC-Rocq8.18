import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace multiplication_MultiplicationDouble_multiplication_errors_basicqtvc
theorem multiplication_errors_basic'vc (a : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) : let exact : ℝ := UDouble.to_real a * UDouble.to_real b * UDouble.to_real c; abs (UDouble.to_real (UDouble.umul (UDouble.umul a b) c) - exact) ≤ ((2 : ℝ) + UDouble.eps) * UDouble.eps * abs exact + UDouble.eta * (abs (UDouble.to_real c) * ((1 : ℝ) + UDouble.eps) + (1 : ℝ))
  := sorry
end multiplication_MultiplicationDouble_multiplication_errors_basicqtvc
