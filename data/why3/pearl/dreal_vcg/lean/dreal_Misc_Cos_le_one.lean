import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_Cos_le_one
axiom exp_limit_fun : ℝ -> Unit
axiom exp_limit_fun'def (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : exp_limit_fun x = ()
axiom exp_limit_fun'spec (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
theorem Cos_le_one (x : ℝ) : abs (Real.cos x) ≤ (1 : ℝ)
  := sorry
end dreal_Misc_Cos_le_one
