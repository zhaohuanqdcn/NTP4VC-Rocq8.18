import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace multiplication_MultiplicationDouble_multiplication_errorsqtvc
theorem multiplication_errors'vc (d : UDouble.udouble) (e : UDouble.udouble) (f : UDouble.udouble) (a : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) : let t : ℝ := (1 : ℝ) + UDouble.eps; let t3 : ℝ := UDouble.eps + UDouble.eps * t; let t4 : ℝ := UDouble.to_real d * (UDouble.to_real e * UDouble.to_real f); let t5 : ℝ := UDouble.to_real a * UDouble.to_real b * UDouble.to_real c; let t6 : ℝ := UDouble.eta * abs (UDouble.to_real d) * t + UDouble.eta; let t7 : ℝ := UDouble.eta * abs (UDouble.to_real c) * t + UDouble.eta; let exact : ℝ := t5 * t4; abs (UDouble.to_real (UDouble.umul (UDouble.umul (UDouble.umul a b) c) (UDouble.umul d (UDouble.umul e f))) - exact) ≤ (UDouble.eps + (t3 + t3 + t3 * t3) * t) * abs exact + ((t6 + t6 * t3) * abs t5 + (t7 + t7 * t3) * abs t4 + t7 * t6) * t + UDouble.eta
  := sorry
end multiplication_MultiplicationDouble_multiplication_errorsqtvc
