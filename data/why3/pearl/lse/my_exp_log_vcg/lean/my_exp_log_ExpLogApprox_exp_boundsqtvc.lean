import Why3.Base
import pearl.lse.lib.lean.my_exp_log.ExpLogLemmas
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace my_exp_log_ExpLogApprox_exp_boundsqtvc
axiom exp_max_value : ℝ
axiom exp_max_value_spec : (0 : ℝ) < exp_max_value
axiom exp_error : ℝ
axiom exp_error_bound : (0 : ℝ) < exp_error ∧ exp_error ≤ (1 : ℝ) / 2
axiom u_exp : UDouble.udouble -> UDouble.udouble
axiom u_exp_spec (x : UDouble.udouble) (fact0 : abs (UDouble.to_real x) ≤ exp_max_value) : abs (UDouble.to_real (u_exp x) - Real.exp (UDouble.to_real x)) ≤ Real.exp (UDouble.to_real x) * exp_error
axiom log_max_value : ℝ
axiom log_max_value_spec : (0 : ℝ) < log_max_value
axiom log_error : ℝ
axiom log_error_bound : (0 : ℝ) < log_error ∧ log_error ≤ (1 : ℝ)
axiom u_log : UDouble.udouble -> UDouble.udouble
axiom u_log_spec (x : UDouble.udouble) (fact0 : (0 : ℝ) < UDouble.to_real x) (fact1 : UDouble.to_real x ≤ log_max_value) : abs (UDouble.to_real (u_log x) - Real.log (UDouble.to_real x)) ≤ abs (Real.log (UDouble.to_real x)) * log_error
axiom log2_error : ℝ
axiom log2_error_bound : (0 : ℝ) ≤ log2_error ∧ log2_error ≤ (1 : ℝ) / 4
theorem exp_bounds'vc (x : ℝ) (fact0 : abs x ≤ exp_max_value) : (14259626853 : ℝ) / 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ≤ Real.exp x ∧ Real.exp x ≤ (7012806227730000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 : ℝ)
  := sorry
end my_exp_log_ExpLogApprox_exp_boundsqtvc
