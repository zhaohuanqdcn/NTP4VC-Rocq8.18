import Why3.Base
import Why3.why3.Ref.Ref
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace sum_SumDouble_sum_of_fun_le_sum_of_abs_funqtvc
axiom abs_real_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> UDouble.udouble) (i : ℤ) : abs_real_fun f i = abs (UDouble.to_real (f i))
theorem sum_of_fun_le_sum_of_abs_fun'vc (i : ℤ) (f : ℤ -> UDouble.udouble) (fact0 : (0 : ℤ) ≤ i) : abs (real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) i) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) i
  := sorry
end sum_SumDouble_sum_of_fun_le_sum_of_abs_funqtvc
