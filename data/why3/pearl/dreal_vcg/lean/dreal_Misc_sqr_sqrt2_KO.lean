import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_sqr_sqrt2_KO
axiom exp_limit_fun : ℝ -> Unit
axiom exp_limit_fun'def (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : exp_limit_fun x = ()
axiom exp_limit_fun'spec (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
theorem sqr_sqrt2_KO (x : ℝ) (fact0 : (0 : ℝ) ≤ x) : HPow.hPow (Real.sqrt x) (2 : ℝ) = x
  := sorry
end dreal_Misc_sqr_sqrt2_KO
