import Why3.Base
import pearl.lse.lib.lean.my_exp_log.ExpLogLemmas
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace my_exp_log_ExpLogApprox_log2_boundsqtvc
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
theorem log2_bounds'vc (x : ℝ) (fact0 : (1 : ℝ) / 1125899906842624 ≤ x) (fact1 : x ≤ (10715086071862673209484250490600018105614048117055336074437503883703510511249361224931983788156958581275946729175531468251871452856923140435984577574698574803934567774824230985421074605062371141877954182153046474983581941267398767559165543946077062914571196477686542167660429831652624386837205668069376 : ℝ)) : abs (Real.logb 2 x) ≤ (3000 : ℝ)
  := sorry
end my_exp_log_ExpLogApprox_log2_boundsqtvc
