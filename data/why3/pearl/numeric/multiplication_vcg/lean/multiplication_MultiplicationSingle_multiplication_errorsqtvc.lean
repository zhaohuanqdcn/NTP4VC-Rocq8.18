import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace multiplication_MultiplicationSingle_multiplication_errorsqtvc
theorem multiplication_errors'vc (d : USingle.usingle) (e : USingle.usingle) (f : USingle.usingle) (a : USingle.usingle) (b : USingle.usingle) (c : USingle.usingle) : let t : ℝ := (1 : ℝ) + USingle.eps; let t3 : ℝ := USingle.eps + USingle.eps * t; let t4 : ℝ := USingle.to_real d * (USingle.to_real e * USingle.to_real f); let t5 : ℝ := USingle.to_real a * USingle.to_real b * USingle.to_real c; let t6 : ℝ := USingle.eta * abs (USingle.to_real d) * t + USingle.eta; let t7 : ℝ := USingle.eta * abs (USingle.to_real c) * t + USingle.eta; let exact : ℝ := t5 * t4; abs (USingle.to_real (USingle.umul (USingle.umul (USingle.umul a b) c) (USingle.umul d (USingle.umul e f))) - exact) ≤ (USingle.eps + (t3 + t3 + t3 * t3) * t) * abs exact + ((t6 + t6 * t3) * abs t5 + (t7 + t7 * t3) * abs t4 + t7 * t6) * t + USingle.eta
  := sorry
end multiplication_MultiplicationSingle_multiplication_errorsqtvc
