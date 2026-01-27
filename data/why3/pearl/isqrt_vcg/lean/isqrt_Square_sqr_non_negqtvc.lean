import Why3.Base
open Classical
open Lean4Why3
namespace isqrt_Square_sqr_non_negqtvc
noncomputable def sqr (x : ℤ) := x * x
theorem sqr_non_neg'vc (x : ℤ) : (0 : ℤ) ≤ sqr x
  := sorry
end isqrt_Square_sqr_non_negqtvc
