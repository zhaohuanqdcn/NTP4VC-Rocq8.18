import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_exp_limit_from_int_KO
axiom exp_limit_fun : ℝ -> Unit
axiom exp_limit_fun'def (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : exp_limit_fun x = ()
axiom exp_limit_fun'spec (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
theorem exp_limit_from_int_KO (x : ℤ) (fact0 : abs x ≤ (25 : ℤ)) : Real.exp (Int.to_Real x) ≤ (72004899338 : ℝ)
  := sorry
end dreal_Misc_exp_limit_from_int_KO
