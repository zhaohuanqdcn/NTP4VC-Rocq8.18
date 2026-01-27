import Why3.Base
open Classical
open Lean4Why3
namespace dreal_P3_cos_bound_harder
theorem cos_bound_harder (x : ℝ) (fact0 : -((7 : ℝ) / 10) ≤ x) (fact1 : x ≤ (7 : ℝ) / 10) : (7 : ℝ) / 10 ≤ Real.cos x ∧ Real.cos x ≤ (1 : ℝ)
  := sorry
end dreal_P3_cos_bound_harder
