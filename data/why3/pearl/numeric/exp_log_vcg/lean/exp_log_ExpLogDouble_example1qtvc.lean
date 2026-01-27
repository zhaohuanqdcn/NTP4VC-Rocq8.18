import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace exp_log_ExpLogDouble_example1qtvc
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
theorem example1'vc (y : UDouble.udouble) (x : UDouble.udouble) : let o1 : UDouble.udouble := exp_approx y; abs (UDouble.to_real o1 - Real.exp (UDouble.to_real y)) ≤ exp_error * Real.exp (UDouble.to_real y) → (0 : ℝ) < UDouble.to_real o1 ∧ (let o2 : UDouble.udouble := log_approx o1; abs (UDouble.to_real o2 - Real.log (UDouble.to_real o1)) ≤ abs (Real.log (UDouble.to_real o1)) * log_error + log_cst_error → (let o3 : UDouble.udouble := exp_approx x; abs (UDouble.to_real o3 - Real.exp (UDouble.to_real x)) ≤ exp_error * Real.exp (UDouble.to_real x) → (0 : ℝ) < UDouble.to_real o3 ∧ (let o4 : UDouble.udouble := log_approx o3; abs (UDouble.to_real o4 - Real.log (UDouble.to_real o3)) ≤ abs (Real.log (UDouble.to_real o3)) * log_error + log_cst_error → (let t : ℝ := Real.log (Real.exp (UDouble.to_real y)); let t1 : ℝ := Real.log (Real.exp (UDouble.to_real x)); let t2 : ℝ := ((1 : ℝ) + UDouble.eps + log_error) * (-Real.log ((1 : ℝ) - exp_error) * ((1 : ℝ) + log_error) + log_cst_error); abs (UDouble.to_real (UDouble.uadd o4 o2) - (t1 + t)) ≤ (log_error + log_error + UDouble.eps) * (abs t1 + abs t) + (t2 + t2)))))
  := sorry
end exp_log_ExpLogDouble_example1qtvc
