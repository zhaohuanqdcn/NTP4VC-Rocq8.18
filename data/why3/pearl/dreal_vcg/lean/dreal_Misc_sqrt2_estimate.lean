import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_sqrt2_estimate
axiom exp_limit_fun : ℝ -> Unit
axiom exp_limit_fun'def (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : exp_limit_fun x = ()
axiom exp_limit_fun'spec (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
theorem sqrt2_estimate : (141421356237 : ℝ) / 100000000000 ≤ Real.sqrt (2 : ℝ) ∧ Real.sqrt (2 : ℝ) ≤ (70710678119 : ℝ) / 50000000000
  := sorry
end dreal_Misc_sqrt2_estimate
