import Why3.Base
open Classical
open Lean4Why3
namespace dreal_P3_MethodErrorWrong
theorem MethodErrorWrong (x : ℝ) (fact0 : abs x ≤ (1 : ℝ) / 32) : abs ((1 : ℝ) - (1 : ℝ) / 2 * (x * x) - Real.cos x) ≤ (1 : ℝ) / 33554432
  := sorry
end dreal_P3_MethodErrorWrong
