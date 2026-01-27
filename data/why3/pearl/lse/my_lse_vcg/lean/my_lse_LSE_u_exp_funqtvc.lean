import Why3.Base
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
import pearl.lse.lib.lean.my_exp_log.ExpLogLemmas
import pearl.lse.lib.lean.my_exp_log.ExpLogApprox
import pearl.lse.lib.lean.sum_real.Sum
import pearl.lse.lib.lean.my_sum.Sum
open Classical
open Lean4Why3
namespace my_lse_LSE_u_exp_funqtvc
axiom exp_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom exp_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : exp_fun a i = Real.exp (my_sum.Sum.real_fun a i)
theorem u_exp_fun'vc : True
  := sorry
end my_lse_LSE_u_exp_funqtvc
