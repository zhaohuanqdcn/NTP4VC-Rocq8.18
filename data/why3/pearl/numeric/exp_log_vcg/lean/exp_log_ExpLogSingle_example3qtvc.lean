import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace exp_log_ExpLogSingle_example3qtvc
axiom log_error : ℝ
axiom log_error_bounds : (0 : ℝ) ≤ log_error ∧ log_error ≤ (1 : ℝ)
axiom log_cst_error : ℝ
axiom log_cst_error_bounds : (0 : ℝ) ≤ log_cst_error ∧ log_cst_error ≤ (1 : ℝ)
axiom log_approx : USingle.usingle -> USingle.usingle
axiom log_approx'spec (x : USingle.usingle) (fact0 : (0 : ℝ) < USingle.to_real x) : abs (USingle.to_real (log_approx x) - Real.log (USingle.to_real x)) ≤ abs (Real.log (USingle.to_real x)) * log_error + log_cst_error
axiom log2_error : ℝ
axiom log2_error_bounds : (0 : ℝ) ≤ log2_error ∧ log2_error ≤ (1 : ℝ)
axiom log2_approx : USingle.usingle -> USingle.usingle
axiom log2_approx'spec (x : USingle.usingle) (fact0 : (0 : ℝ) < USingle.to_real x) : abs (USingle.to_real (log2_approx x) - Real.logb 2 (USingle.to_real x)) ≤ abs (Real.logb 2 (USingle.to_real x)) * log2_error
axiom log10_error : ℝ
axiom log10_error_bounds : (0 : ℝ) ≤ log10_error ∧ log10_error ≤ (1 : ℝ)
axiom log10_approx : USingle.usingle -> USingle.usingle
axiom log10_approx'spec (x : USingle.usingle) (fact0 : (0 : ℝ) < USingle.to_real x) : abs (USingle.to_real (log10_approx x) - Real.logb 10 (USingle.to_real x)) ≤ abs (Real.logb 10 (USingle.to_real x)) * log10_error
axiom exp_error : ℝ
axiom exp_error_bounds : (0 : ℝ) ≤ exp_error ∧ exp_error ≤ (1 : ℝ) / 4
axiom exp_approx : USingle.usingle -> USingle.usingle
axiom exp_approx'spec (x : USingle.usingle) : abs (USingle.to_real (exp_approx x) - Real.exp (USingle.to_real x)) ≤ exp_error * Real.exp (USingle.to_real x)
theorem example3'vc (x : USingle.usingle) (y : USingle.usingle) (fact0 : (0 : ℝ) < USingle.to_real x) (fact1 : (0 : ℝ) < USingle.to_real y) : let o1 : USingle.usingle := USingle.uadd x y; (0 : ℝ) < USingle.to_real o1 ∧ (let result : USingle.usingle := log2_approx o1; abs (USingle.to_real result - Real.logb 2 (USingle.to_real o1)) ≤ abs (Real.logb 2 (USingle.to_real o1)) * log2_error → (let exact : ℝ := Real.logb 2 (USingle.to_real x + USingle.to_real y); abs (USingle.to_real result - exact) ≤ abs exact * log2_error + -Real.logb 2 ((1 : ℝ) - USingle.eps) * ((1 : ℝ) + log2_error)))
  := sorry
end exp_log_ExpLogSingle_example3qtvc
