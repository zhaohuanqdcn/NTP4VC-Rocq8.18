import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace add_sub_mul_AddSubMulSingle_example1qtvc
theorem example1'vc (a : USingle.usingle) (b : USingle.usingle) (c : USingle.usingle) (d : USingle.usingle) : abs (USingle.to_real (USingle.umul (USingle.usub (USingle.uadd a b) c) d) - (USingle.to_real a + USingle.to_real b - USingle.to_real c) * USingle.to_real d) ≤ (31 : ℝ) / 10 * USingle.eps * abs ((abs (USingle.to_real a + USingle.to_real b) + abs (USingle.to_real c)) * USingle.to_real d) + USingle.eta
  := sorry
end add_sub_mul_AddSubMulSingle_example1qtvc
