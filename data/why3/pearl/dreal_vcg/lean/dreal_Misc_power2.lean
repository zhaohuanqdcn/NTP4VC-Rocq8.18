import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_power2
axiom exp_limit_fun : ℝ -> Unit
axiom exp_limit_fun'def (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : exp_limit_fun x = ()
axiom exp_limit_fun'spec (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
theorem power2 (x : ℝ) (fact0 : (5 : ℝ) / 2 < x) : (20 : ℝ) < HPow.hPow x (3 : ℝ) * (2 : ℝ)
  := sorry
end dreal_Misc_power2
