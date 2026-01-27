import Why3.Base
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
import pearl.lse.lib.lean.my_exp_log.ExpLogLemmas
import pearl.lse.lib.lean.my_exp_log.ExpLogApprox
import pearl.lse.lib.lean.sum_real.Sum
import pearl.lse.lib.lean.my_sum.Sum
import pearl.lse.lib.lean.my_sum.Bound
import pearl.lse.lib.lean.my_sum.Combine
open Classical
open Lean4Why3
namespace my_lse_LSE_lse_accuracyqtvc
axiom exp_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom exp_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : exp_fun a i = Real.exp (my_sum.Sum.real_fun a i)
axiom u_exp_fun : (ℤ -> UDouble.udouble) -> ℤ -> UDouble.udouble
axiom u_exp_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : u_exp_fun a i = ExpLogApprox.u_exp (a i)
noncomputable def u_sum_of_u_exp (a : ℤ -> UDouble.udouble) (m : ℤ) (n : ℤ) := my_sum.Sum.u_sum (u_exp_fun a) m n
noncomputable def lse_exact (f : ℤ -> UDouble.udouble) (size : ℤ) := Real.log (sum_real.Sum.sum (exp_fun f) (0 : ℤ) size)
theorem lse_accuracy'vc (size : ℤ) (a : ℤ -> UDouble.udouble) (fact0 : (1 : ℤ) ≤ size) (fact1 : Int.to_Real (size - (1 : ℤ)) ≤ (2251799813685248 : ℝ)) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < size → abs (UDouble.to_real (a i)) ≤ ExpLogApprox.exp_max_value) (fact3 : Real.exp ExpLogApprox.exp_max_value * ((1 : ℝ) + ExpLogApprox.exp_error) * Int.to_Real size * ((1 : ℝ) + (1 : ℝ) / 9007199254740992 / ((1 : ℝ) + (1 : ℝ) / 9007199254740992) * Int.to_Real (size - (1 : ℤ))) ≤ ExpLogApprox.log_max_value) : abs (UDouble.to_real (ExpLogApprox.u_log (u_sum_of_u_exp a (0 : ℤ) size)) - lse_exact a size) ≤ ExpLogApprox.log_error * abs (lse_exact a size) - Real.log ((1 : ℝ) - (ExpLogApprox.exp_error + (1 : ℝ) / 9007199254740992 / ((1 : ℝ) + (1 : ℝ) / 9007199254740992) * Int.to_Real (size - (1 : ℤ)) * ((1 : ℝ) + ExpLogApprox.exp_error))) * ((1 : ℝ) + ExpLogApprox.log_error)
  := sorry
end my_lse_LSE_lse_accuracyqtvc
