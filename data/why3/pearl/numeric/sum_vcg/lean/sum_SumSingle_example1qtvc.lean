import Why3.Base
import Why3.why3.Ref.Ref
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace sum_SumSingle_example1qtvc
axiom abs_real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : abs_real_fun f i = abs (USingle.to_real (f i))
axiom exact_f : ℤ -> ℝ
axiom f' : ℤ -> ℝ
axiom f'_def (i : ℤ) : f' i = abs (exact_f i)
axiom f_rel_err : ℝ
axiom f_cst_err : ℝ
theorem example1'vc (n : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ n) (fact1 : ∀(i : ℤ), abs (USingle.to_real (f i) - exact_f i) ≤ f' i * f_rel_err) : (0 : ℤ) ≤ n ∧ (∀(result : USingle.usingle), abs (USingle.to_real result - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) n) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) n * (USingle.eps * Int.to_Real n) → abs (USingle.to_real result - real.Sum.sum exact_f (0 : ℤ) n) ≤ real.Sum.sum f' (0 : ℤ) n * (f_rel_err + USingle.eps * Int.to_Real n * ((1 : ℝ) + f_rel_err)))
  := sorry
end sum_SumSingle_example1qtvc
