import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_Cos_sum
axiom exp_limit_fun : ℝ -> Unit
axiom exp_limit_fun'def (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : exp_limit_fun x = ()
axiom exp_limit_fun'spec (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
theorem Cos_sum (x : ℝ) (y : ℝ) : Real.cos (x + y) = Real.cos x * Real.cos y - Real.sin x * Real.sin y
  := sorry
end dreal_Misc_Cos_sum
