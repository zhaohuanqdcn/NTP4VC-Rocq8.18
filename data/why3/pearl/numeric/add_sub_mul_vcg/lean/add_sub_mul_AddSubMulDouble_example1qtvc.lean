import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace add_sub_mul_AddSubMulDouble_example1qtvc
theorem example1'vc (a : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) (d : UDouble.udouble) : abs (UDouble.to_real (UDouble.umul (UDouble.usub (UDouble.uadd a b) c) d) - (UDouble.to_real a + UDouble.to_real b - UDouble.to_real c) * UDouble.to_real d) ≤ (31 : ℝ) / 10 * UDouble.eps * abs ((abs (UDouble.to_real a + UDouble.to_real b) + abs (UDouble.to_real c)) * UDouble.to_real d) + UDouble.eta
  := sorry
end add_sub_mul_AddSubMulDouble_example1qtvc
