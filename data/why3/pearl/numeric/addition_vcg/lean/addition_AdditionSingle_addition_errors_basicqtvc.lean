import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace addition_AdditionSingle_addition_errors_basicqtvc
theorem addition_errors_basic'vc (a : USingle.usingle) (b : USingle.usingle) (c : USingle.usingle) : abs (USingle.to_real (USingle.uadd (USingle.uadd a b) c) - (USingle.to_real a + USingle.to_real b + USingle.to_real c)) ≤ (2 : ℝ) * USingle.eps * (abs (USingle.to_real a) + abs (USingle.to_real b) + abs (USingle.to_real c))
  := sorry
end addition_AdditionSingle_addition_errors_basicqtvc
