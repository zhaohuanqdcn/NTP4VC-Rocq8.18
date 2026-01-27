import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace sin_cos_SinCosSingle_cos_simple_exampleqtvc
axiom sin_rel_err : ℝ
axiom sin_rel_err_range : (0 : ℝ) ≤ sin_rel_err
axiom sin_abs_err : ℝ
axiom sin_abs_err_range : (0 : ℝ) ≤ sin_abs_err
axiom sin_max : ℝ
axiom sin_max_range : (0 : ℝ) ≤ sin_max
axiom cos_rel_err : ℝ
axiom cos_rel_err_range : (0 : ℝ) ≤ cos_rel_err
axiom cos_abs_err : ℝ
axiom cos_abs_err_range : (0 : ℝ) ≤ cos_abs_err
axiom cos_max : ℝ
axiom cos_max_range : (0 : ℝ) ≤ cos_max
theorem cos_simple_example'vc (a : USingle.usingle) (b : USingle.usingle) (fact0 : abs (USingle.to_real a) ≤ (1 : ℝ) / 4 * cos_max) (fact1 : abs (USingle.to_real b) ≤ (1 : ℝ) / 4 * cos_max) : let o1 : USingle.usingle := USingle.usub a b; abs (USingle.to_real o1) ≤ cos_max ∧ (∀(result : USingle.usingle), abs (USingle.to_real result - Real.cos (USingle.to_real o1)) ≤ cos_rel_err * abs (Real.cos (USingle.to_real o1)) + cos_abs_err → abs (USingle.to_real result - Real.cos (USingle.to_real a - USingle.to_real b)) ≤ cos_rel_err * abs (Real.cos (USingle.to_real a - USingle.to_real b)) + USingle.eps * abs (USingle.to_real a - USingle.to_real b) * ((1 : ℝ) + cos_rel_err) + cos_abs_err)
  := sorry
end sin_cos_SinCosSingle_cos_simple_exampleqtvc
