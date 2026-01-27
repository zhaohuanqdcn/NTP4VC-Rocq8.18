import Why3.Base
import pearl.lse.lib.lean.my_sum.Sum
import pearl.lse.lib.lean.sum_real.Sum
import pearl.lse.lib.lean.udouble.UDouble
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace my_sum_Combine_u_sum_accuracy_combine_posqtvc
theorem u_sum_accuracy_combine_pos'vc (a : ℤ) (b : ℤ) (f' : ℤ -> UDouble.udouble) (f : ℤ -> ℝ) (rel_err : ℝ) (abs_err : ℝ) (fact0 : ∀(i : ℤ), a ≤ i ∧ i < b → abs (my_sum.Sum.real_fun f' i - f i) ≤ abs (f i) * rel_err + abs_err) (fact1 : ∀(i : ℤ), a ≤ i ∧ i < b → (0 : ℝ) ≤ f i) (fact2 : (0 : ℝ) ≤ rel_err) (fact3 : rel_err ≤ (1 : ℝ)) (fact4 : (0 : ℝ) ≤ abs_err) (fact5 : abs_err ≤ (1 : ℝ)) (fact6 : (0 : ℤ) ≤ b - a) : abs (UDouble.to_real (my_sum.Sum.u_sum f' a b) - sum_real.Sum.sum f a b) ≤ sum_real.Sum.sum f a b * (rel_err + (1 : ℝ) / 9007199254740992 / ((1 : ℝ) + (1 : ℝ) / 9007199254740992) * Int.to_Real (b - a - (1 : ℤ)) * ((1 : ℝ) + rel_err)) + abs_err * (((1 : ℝ) + (1 : ℝ) / 9007199254740992 / ((1 : ℝ) + (1 : ℝ) / 9007199254740992) * Int.to_Real (b - a - (1 : ℤ))) * Int.to_Real (b - a))
  := sorry
end my_sum_Combine_u_sum_accuracy_combine_posqtvc
