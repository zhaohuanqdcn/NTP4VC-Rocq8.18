import Why3.Base
import pearl.lse.lib.lean.my_sum.Sum
import pearl.lse.lib.lean.sum_real.Sum
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace my_sum_Bound_u_sum_constant_boundsqtvc
theorem u_sum_constant_bounds'vc (n : ℤ) (m : ℤ) (size : ℤ) (max : ℝ) (a : ℤ -> UDouble.udouble) (fact0 : (0 : ℤ) ≤ n - m) (fact1 : n - m ≤ size) (fact2 : (0 : ℝ) ≤ max) (fact3 : ∀(i : ℤ), m ≤ i ∧ i < n → abs (UDouble.to_real (a i)) ≤ max) : let o1 : ℤ -> ℝ := my_sum.Sum.real_fun a; let o2 : ℝ := -max; (m ≤ n ∧ (∀(i : ℤ), m ≤ i ∧ i < n → o2 ≤ o1 i ∧ o1 i ≤ max)) ∧ (Int.to_Real (n - m) * o2 ≤ sum_real.Sum.sum o1 m n ∧ sum_real.Sum.sum o1 m n ≤ Int.to_Real (n - m) * max → (let o3 : ℤ -> ℝ := my_sum.Sum.abs_real_fun a; (m ≤ n ∧ (∀(i : ℤ), m ≤ i ∧ i < n → (0 : ℝ) ≤ o3 i ∧ o3 i ≤ max)) ∧ (Int.to_Real (n - m) * (0 : ℝ) ≤ sum_real.Sum.sum o3 m n ∧ sum_real.Sum.sum o3 m n ≤ Int.to_Real (n - m) * max → abs (UDouble.to_real (my_sum.Sum.u_sum a m n)) ≤ max * Int.to_Real size * ((1 : ℝ) + (1 : ℝ) / 9007199254740992 / ((1 : ℝ) + (1 : ℝ) / 9007199254740992) * Int.to_Real (size - (1 : ℤ))))))
  := sorry
end my_sum_Bound_u_sum_constant_boundsqtvc
