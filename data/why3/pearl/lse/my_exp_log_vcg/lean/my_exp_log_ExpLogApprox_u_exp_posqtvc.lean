import Why3.Base
import pearl.lse.lib.lean.my_exp_log.ExpLogLemmas
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace my_exp_log_ExpLogApprox_u_exp_posqtvc
axiom exp_max_value : ℝ
axiom exp_max_value_spec : (0 : ℝ) < exp_max_value
axiom exp_error : ℝ
axiom exp_error_bound : (0 : ℝ) < exp_error ∧ exp_error ≤ (1 : ℝ) / 2
axiom u_exp : UDouble.udouble -> UDouble.udouble
axiom u_exp_spec (x : UDouble.udouble) (fact0 : abs (UDouble.to_real x) ≤ exp_max_value) : abs (UDouble.to_real (u_exp x) - Real.exp (UDouble.to_real x)) ≤ Real.exp (UDouble.to_real x) * exp_error
theorem u_exp_pos'vc (x : UDouble.udouble) (fact0 : abs (UDouble.to_real x) ≤ exp_max_value) : (0 : ℝ) < UDouble.to_real (u_exp x)
  := sorry
end my_exp_log_ExpLogApprox_u_exp_posqtvc
