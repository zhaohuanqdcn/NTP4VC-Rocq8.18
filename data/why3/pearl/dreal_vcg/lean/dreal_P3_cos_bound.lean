import Why3.Base
open Classical
open Lean4Why3
namespace dreal_P3_cos_bound
theorem cos_bound (x : ℝ) : -(1 : ℝ) ≤ Real.cos x ∧ Real.cos x ≤ (1 : ℝ)
  := sorry
end dreal_P3_cos_bound
