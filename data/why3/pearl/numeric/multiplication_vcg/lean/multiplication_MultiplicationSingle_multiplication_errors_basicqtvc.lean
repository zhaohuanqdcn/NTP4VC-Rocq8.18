import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace multiplication_MultiplicationSingle_multiplication_errors_basicqtvc
theorem multiplication_errors_basic'vc (a : USingle.usingle) (b : USingle.usingle) (c : USingle.usingle) : let exact : ℝ := USingle.to_real a * USingle.to_real b * USingle.to_real c; abs (USingle.to_real (USingle.umul (USingle.umul a b) c) - exact) ≤ ((2 : ℝ) + USingle.eps) * USingle.eps * abs exact + USingle.eta * (abs (USingle.to_real c) * ((1 : ℝ) + USingle.eps) + (1 : ℝ))
  := sorry
end multiplication_MultiplicationSingle_multiplication_errors_basicqtvc
