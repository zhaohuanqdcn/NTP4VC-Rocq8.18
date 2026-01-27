import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace substraction_SubstractionDouble_substraction_errorsqtvc
theorem substraction_errors'vc (a : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) (d : UDouble.udouble) (e : UDouble.udouble) (f : UDouble.udouble) : abs (UDouble.to_real (UDouble.usub (UDouble.usub (UDouble.usub a b) c) (UDouble.usub d (UDouble.usub e f))) - (UDouble.to_real a - UDouble.to_real b - UDouble.to_real c - (UDouble.to_real d - (UDouble.to_real e - UDouble.to_real f)))) ≤ (5 : ℝ) * UDouble.eps * (abs (UDouble.to_real a) + abs (UDouble.to_real b) + abs (UDouble.to_real c) + abs (UDouble.to_real d) + abs (UDouble.to_real e) + abs (UDouble.to_real f))
  := sorry
end substraction_SubstractionDouble_substraction_errorsqtvc
