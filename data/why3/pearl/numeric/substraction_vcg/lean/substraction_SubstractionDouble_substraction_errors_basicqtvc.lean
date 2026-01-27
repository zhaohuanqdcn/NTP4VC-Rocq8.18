import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace substraction_SubstractionDouble_substraction_errors_basicqtvc
theorem substraction_errors_basic'vc (a : UDouble.udouble) (b : UDouble.udouble) (c : UDouble.udouble) : abs (UDouble.to_real (UDouble.usub (UDouble.usub a b) c) - (UDouble.to_real a - UDouble.to_real b - UDouble.to_real c)) ≤ (2 : ℝ) * UDouble.eps * (abs (UDouble.to_real a) + abs (UDouble.to_real b) + abs (UDouble.to_real c))
  := sorry
end substraction_SubstractionDouble_substraction_errors_basicqtvc
