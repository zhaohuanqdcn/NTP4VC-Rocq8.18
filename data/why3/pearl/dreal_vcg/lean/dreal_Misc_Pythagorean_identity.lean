import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_Pythagorean_identity
axiom exp_limit_fun : ℝ -> Unit
axiom exp_limit_fun'def (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : exp_limit_fun x = ()
axiom exp_limit_fun'spec (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
theorem Pythagorean_identity (x : ℝ) : HPow.hPow (Real.cos x) 2 + HPow.hPow (Real.sin x) 2 = (1 : ℝ)
  := sorry
end dreal_Misc_Pythagorean_identity
