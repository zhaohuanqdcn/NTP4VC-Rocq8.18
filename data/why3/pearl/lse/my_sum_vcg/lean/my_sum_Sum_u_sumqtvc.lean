import Why3.Base
import pearl.lse.lib.lean.sum_real.Sum
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace my_sum_Sum_u_sumqtvc
theorem u_sum'vc (n : ℤ) (m : ℤ) (fact0 : ¬n ≤ m) : (0 : ℤ) ≤ n - m ∧ n - (1 : ℤ) - m < n - m
  := sorry
end my_sum_Sum_u_sumqtvc
