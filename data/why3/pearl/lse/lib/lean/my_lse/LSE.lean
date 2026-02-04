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
namespace LSE
axiom exp_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom exp_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : exp_fun a i = Real.exp (my_sum.Sum.real_fun a i)
axiom u_exp_fun : (ℤ -> UDouble.udouble) -> ℤ -> UDouble.udouble
axiom u_exp_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : u_exp_fun a i = ExpLogApprox.u_exp (a i)
noncomputable def u_sum_of_u_exp (a : ℤ -> UDouble.udouble) (m : ℤ) (n : ℤ) := my_sum.Sum.u_sum (u_exp_fun a) m n
noncomputable def lse_exact (f : ℤ -> UDouble.udouble) (size : ℤ) := Real.log (sum_real.Sum.sum (exp_fun f) (0 : ℤ) size)
end LSE
