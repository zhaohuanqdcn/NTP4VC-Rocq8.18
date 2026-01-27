import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace addition_AdditionDouble_addition_errorsqtvc
theorem addition_errors'vc (a : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) (d : UDouble.udouble) (e : UDouble.udouble) (f : UDouble.udouble) : abs (UDouble.to_real (UDouble.uadd (UDouble.uadd (UDouble.uadd a b) c) (UDouble.uadd d (UDouble.uadd e f))) - (UDouble.to_real a + UDouble.to_real b + UDouble.to_real c + UDouble.to_real d + UDouble.to_real e + UDouble.to_real f)) ≤ (5 : ℝ) * UDouble.eps * (abs (UDouble.to_real a) + abs (UDouble.to_real b) + abs (UDouble.to_real c) + abs (UDouble.to_real d) + abs (UDouble.to_real e) + abs (UDouble.to_real f))
  := sorry
end addition_AdditionDouble_addition_errorsqtvc
