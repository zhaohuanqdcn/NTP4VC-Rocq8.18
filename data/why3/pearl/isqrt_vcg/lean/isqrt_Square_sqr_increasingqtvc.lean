import Why3.Base
open Classical
open Lean4Why3
namespace isqrt_Square_sqr_increasingqtvc
noncomputable def sqr (x : ℤ) := x * x
theorem sqr_increasing'vc (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x ≤ y) : sqr x ≤ sqr y
  := sorry
end isqrt_Square_sqr_increasingqtvc
