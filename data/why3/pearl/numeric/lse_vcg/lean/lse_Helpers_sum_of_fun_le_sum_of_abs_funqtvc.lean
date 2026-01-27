import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace lse_Helpers_sum_of_fun_le_sum_of_abs_funqtvc
axiom abs_fun : (ℤ -> ℝ) -> ℤ -> ℝ
axiom abs_fun'def (f : ℤ -> ℝ) (i : ℤ) : abs_fun f i = abs (f i)
axiom abs_real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : abs_real_fun f i = abs_fun (USingleLemmas.real_fun f) i
theorem sum_of_fun_le_sum_of_abs_fun'vc (b : ℤ) (a : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ b - a) : abs (real.Sum.sum (USingleLemmas.real_fun f) a b) ≤ real.Sum.sum (abs_real_fun f) a b
  := sorry
end lse_Helpers_sum_of_fun_le_sum_of_abs_funqtvc
