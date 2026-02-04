import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace ExpLogSingle
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
end ExpLogSingle
