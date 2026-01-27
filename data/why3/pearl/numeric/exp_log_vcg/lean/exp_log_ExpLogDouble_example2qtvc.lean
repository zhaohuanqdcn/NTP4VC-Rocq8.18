import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace exp_log_ExpLogDouble_example2qtvc
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
theorem example2'vc (y : UDouble.udouble) (x : UDouble.udouble) (fact0 : exp_error ≤ (1 : ℝ) / 4) : let o1 : UDouble.udouble := exp_approx y; abs (UDouble.to_real o1 - Real.exp (UDouble.to_real y)) ≤ exp_error * Real.exp (UDouble.to_real y) → (let o2 : UDouble.udouble := exp_approx x; abs (UDouble.to_real o2 - Real.exp (UDouble.to_real x)) ≤ exp_error * Real.exp (UDouble.to_real x) → (let o3 : UDouble.udouble := UDouble.uadd o2 o1; (0 : ℝ) < UDouble.to_real o3 ∧ (let result : UDouble.udouble := log_approx o3; abs (UDouble.to_real result - Real.log (UDouble.to_real o3)) ≤ abs (Real.log (UDouble.to_real o3)) * log_error + log_cst_error → (let exact : ℝ := Real.log (Real.exp (UDouble.to_real x) + Real.exp (UDouble.to_real y)); abs (UDouble.to_real result - exact) ≤ abs exact * log_error + -Real.log ((1 : ℝ) - ((2 : ℝ) * exp_error + UDouble.eps)) * ((1 : ℝ) + log_error) + log_cst_error))))
  := sorry
end exp_log_ExpLogDouble_example2qtvc
