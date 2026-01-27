import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Misc_huge_power
axiom exp_limit_fun : ℝ -> Unit
axiom exp_limit_fun'def (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : exp_limit_fun x = ()
axiom exp_limit_fun'spec (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
theorem huge_power : HPow.hPow (5 : ℝ) (100 : ℝ) ≤ (7888609100000000000000000000000000000000000000000000000000000000000000 : ℝ)
  := sorry
end dreal_Misc_huge_power
