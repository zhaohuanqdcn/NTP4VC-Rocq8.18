import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace exp_log_ExpLogSingle_example1qtvc
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
theorem example1'vc (y : USingle.usingle) (x : USingle.usingle) : let o1 : USingle.usingle := exp_approx y; abs (USingle.to_real o1 - Real.exp (USingle.to_real y)) ≤ exp_error * Real.exp (USingle.to_real y) → (0 : ℝ) < USingle.to_real o1 ∧ (let o2 : USingle.usingle := log_approx o1; abs (USingle.to_real o2 - Real.log (USingle.to_real o1)) ≤ abs (Real.log (USingle.to_real o1)) * log_error + log_cst_error → (let o3 : USingle.usingle := exp_approx x; abs (USingle.to_real o3 - Real.exp (USingle.to_real x)) ≤ exp_error * Real.exp (USingle.to_real x) → (0 : ℝ) < USingle.to_real o3 ∧ (let o4 : USingle.usingle := log_approx o3; abs (USingle.to_real o4 - Real.log (USingle.to_real o3)) ≤ abs (Real.log (USingle.to_real o3)) * log_error + log_cst_error → (let t : ℝ := Real.log (Real.exp (USingle.to_real y)); let t1 : ℝ := Real.log (Real.exp (USingle.to_real x)); let t2 : ℝ := ((1 : ℝ) + USingle.eps + log_error) * (-Real.log ((1 : ℝ) - exp_error) * ((1 : ℝ) + log_error) + log_cst_error); abs (USingle.to_real (USingle.uadd o4 o2) - (t1 + t)) ≤ (log_error + log_error + USingle.eps) * (abs t1 + abs t) + (t2 + t2)))))
  := sorry
end exp_log_ExpLogSingle_example1qtvc
