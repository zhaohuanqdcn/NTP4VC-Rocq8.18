import Why3.Base
import pearl.lse.lib.lean.sum_real.Sum
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace my_sum_Sum_u_sum_accuracyqtvc
axiom u_sum : (ℤ -> UDouble.udouble) -> ℤ -> ℤ -> UDouble.udouble
axiom u_sum'def (n : ℤ) (m : ℤ) (a : ℤ -> UDouble.udouble) : if n ≤ m then u_sum a m n = UDouble.uzero else u_sum a m n = UDouble.uadd (u_sum a m (n - (1 : ℤ))) (a (n - (1 : ℤ)))
axiom real_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom real_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : real_fun a i = UDouble.to_real (a i)
axiom abs_real_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom abs_real_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : abs_real_fun a i = abs (UDouble.to_real (a i))
theorem u_sum_accuracy'vc (m : ℤ) (n : ℤ) (a : ℤ -> UDouble.udouble) (fact0 : m ≤ n) : abs (UDouble.to_real (u_sum a m n) - sum_real.Sum.sum (real_fun a) m n) ≤ Int.to_Real (n - m - (1 : ℤ)) * ((1 : ℝ) / 9007199254740992 / ((1 : ℝ) + (1 : ℝ) / 9007199254740992)) * sum_real.Sum.sum (abs_real_fun a) m n
  := sorry
end my_sum_Sum_u_sum_accuracyqtvc
