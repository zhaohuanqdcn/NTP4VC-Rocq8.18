import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace exp_log_ExpLogDouble_example3qtvc
axiom log_error : ℝ
axiom log_error_bounds : (0 : ℝ) ≤ log_error ∧ log_error ≤ (1 : ℝ)
axiom log_cst_error : ℝ
axiom log_cst_error_bounds : (0 : ℝ) ≤ log_cst_error ∧ log_cst_error ≤ (1 : ℝ)
axiom log_approx : UDouble.udouble -> UDouble.udouble
axiom log_approx'spec (x : UDouble.udouble) (fact0 : (0 : ℝ) < UDouble.to_real x) : abs (UDouble.to_real (log_approx x) - Real.log (UDouble.to_real x)) ≤ abs (Real.log (UDouble.to_real x)) * log_error + log_cst_error
axiom exp_error : ℝ
axiom exp_error_bounds : (0 : ℝ) ≤ exp_error ∧ exp_error ≤ (1 : ℝ) / 2
axiom exp_approx : UDouble.udouble -> UDouble.udouble
axiom exp_approx'spec (x : UDouble.udouble) : abs (UDouble.to_real (exp_approx x) - Real.exp (UDouble.to_real x)) ≤ exp_error * Real.exp (UDouble.to_real x)
axiom log2_rel_error : ℝ
axiom log2_rel_error_bounds : (0 : ℝ) ≤ log2_rel_error ∧ log2_rel_error ≤ (1 : ℝ)
axiom log2_abs_error : ℝ
axiom log2_abs_error_bounds : (0 : ℝ) ≤ log2_abs_error ∧ log2_abs_error ≤ (1 : ℝ)
axiom log2_approx : UDouble.udouble -> UDouble.udouble
axiom log2_approx'spec (x : UDouble.udouble) (fact0 : (0 : ℝ) < UDouble.to_real x) : abs (UDouble.to_real (log2_approx x) - Real.logb 2 (UDouble.to_real x)) ≤ abs (Real.logb 2 (UDouble.to_real x)) * log2_rel_error + log2_abs_error
axiom log10_error : ℝ
axiom log10_error_bounds : (0 : ℝ) ≤ log10_error ∧ log10_error ≤ (1 : ℝ)
axiom log10_approx : UDouble.udouble -> UDouble.udouble
axiom log10_approx'spec (x : UDouble.udouble) (fact0 : (0 : ℝ) < UDouble.to_real x) : abs (UDouble.to_real (log10_approx x) - Real.logb 10 (UDouble.to_real x)) ≤ abs (Real.logb 10 (UDouble.to_real x)) * log10_error
theorem example3'vc (x : UDouble.udouble) (y : UDouble.udouble) (fact0 : (0 : ℝ) < UDouble.to_real x) (fact1 : (0 : ℝ) < UDouble.to_real y) : let o1 : UDouble.udouble := UDouble.uadd x y; (0 : ℝ) < UDouble.to_real o1 ∧ (let result : UDouble.udouble := log2_approx o1; abs (UDouble.to_real result - Real.logb 2 (UDouble.to_real o1)) ≤ abs (Real.logb 2 (UDouble.to_real o1)) * log2_rel_error + log2_abs_error → (let exact : ℝ := Real.logb 2 (UDouble.to_real x + UDouble.to_real y); abs (UDouble.to_real result - exact) ≤ abs exact * log2_rel_error + -Real.logb 2 ((1 : ℝ) - UDouble.eps) * ((1 : ℝ) + log2_rel_error) + log2_abs_error))
  := sorry
end exp_log_ExpLogDouble_example3qtvc
