import Why3.Base
open Classical
open Lean4Why3
namespace dreal_P_sqr_pos
noncomputable def sqr (x : ℝ) := x * x
theorem sqr_pos (x : ℝ) : (0 : ℝ) ≤ sqr x
  := sorry
end dreal_P_sqr_pos
