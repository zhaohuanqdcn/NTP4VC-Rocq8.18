import Why3.Base
import Why3.why3.Ref.Ref
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace sum_SumSingle_sum_of_fun_le_sum_of_abs_funqtvc
axiom abs_real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : abs_real_fun f i = abs (USingle.to_real (f i))
theorem sum_of_fun_le_sum_of_abs_fun'vc (i : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ i) : abs (real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) i) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) i
  := sorry
end sum_SumSingle_sum_of_fun_le_sum_of_abs_funqtvc
