import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace sin_cos_SinCosSingle_r_cos_thetaqtvc
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
theorem r_cos_theta'vc (r : USingle.usingle) (r_exact : ℝ) (theta : USingle.usingle) (theta_exact : ℝ) (r_err : ℝ) (theta_err : ℝ) (fact0 : (3927 : ℝ) / 1250 ≤ cos_max) (fact1 : (0 : ℝ) ≤ USingle.to_real r) (fact2 : USingle.to_real r ≤ (1 : ℝ)) (fact3 : (0 : ℝ) ≤ r_exact) (fact4 : r_exact ≤ (1 : ℝ)) (fact5 : -((3927 : ℝ) / 1250) ≤ USingle.to_real theta) (fact6 : USingle.to_real theta ≤ (3927 : ℝ) / 1250) (fact7 : -((3927 : ℝ) / 1250) ≤ theta_exact) (fact8 : theta_exact ≤ (3927 : ℝ) / 1250) (fact9 : abs (USingle.to_real r - r_exact) ≤ r_err) (fact10 : abs (USingle.to_real theta - theta_exact) ≤ theta_err) : abs (USingle.to_real theta) ≤ cos_max ∧ (∀(o1 : USingle.usingle), abs (USingle.to_real o1 - Real.cos (USingle.to_real theta)) ≤ cos_rel_err * abs (Real.cos (USingle.to_real theta)) + cos_abs_err → (let t1 : ℝ := (1 : ℝ) + USingle.eps; let t3 : ℝ := theta_err * ((1 : ℝ) + cos_rel_err) + cos_abs_err; abs (USingle.to_real (USingle.umul r o1) - r_exact * Real.cos theta_exact) ≤ (USingle.eps + cos_rel_err * t1) * abs (r_exact * Real.cos theta_exact) + (t3 * abs r_exact + (r_err + r_err * cos_rel_err) * abs (Real.cos theta_exact) + r_err * t3) * t1 + USingle.eta))
  := sorry
end sin_cos_SinCosSingle_r_cos_thetaqtvc
