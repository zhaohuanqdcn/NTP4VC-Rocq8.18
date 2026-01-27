import Why3.Base
open Classical
open Lean4Why3
namespace isqrt_Square_sqr_sumqtvc
noncomputable def sqr (x : ℤ) := x * x
theorem sqr_sum'vc (x : ℤ) (y : ℤ) : sqr (x + y) = sqr x + (2 : ℤ) * x * y + sqr y
  := sorry
end isqrt_Square_sqr_sumqtvc
