import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace addition_AdditionSingle_addition_errorsqtvc
theorem addition_errors'vc (a : USingle.usingle) (b : USingle.usingle) (c : USingle.usingle) (d : USingle.usingle) (e : USingle.usingle) (f : USingle.usingle) : abs (USingle.to_real (USingle.uadd (USingle.uadd (USingle.uadd a b) c) (USingle.uadd d (USingle.uadd e f))) - (USingle.to_real a + USingle.to_real b + USingle.to_real c + USingle.to_real d + USingle.to_real e + USingle.to_real f)) ≤ (5 : ℝ) * USingle.eps * (abs (USingle.to_real a) + abs (USingle.to_real b) + abs (USingle.to_real c) + abs (USingle.to_real d) + abs (USingle.to_real e) + abs (USingle.to_real f))
  := sorry
end addition_AdditionSingle_addition_errorsqtvc
