import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_exp_limit
theorem exp_limit (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
  := sorry
end dreal_Misc_exp_limit
