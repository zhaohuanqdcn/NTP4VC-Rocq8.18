import Why3.Base
import pearl.lse.lib.lean.sum_real.Sum
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace my_sum.Sum
axiom u_sum : (ℤ -> UDouble.udouble) -> ℤ -> ℤ -> UDouble.udouble
axiom u_sum'def (n : ℤ) (m : ℤ) (a : ℤ -> UDouble.udouble) : if n ≤ m then u_sum a m n = UDouble.uzero else u_sum a m n = UDouble.uadd (u_sum a m (n - (1 : ℤ))) (a (n - (1 : ℤ)))
axiom real_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom real_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : real_fun a i = UDouble.to_real (a i)
axiom abs_real_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom abs_real_fun'def (a : ℤ -> UDouble.udouble) (i : ℤ) : abs_real_fun a i = abs (UDouble.to_real (a i))
end my_sum.Sum
