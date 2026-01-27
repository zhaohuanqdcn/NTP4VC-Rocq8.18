import Why3.Base
open Classical
open Lean4Why3
namespace Square
noncomputable def sqr (x : ℤ) := x * x
noncomputable def isqrt_spec (x : ℤ) (res : ℤ) := (0 : ℤ) ≤ res ∧ sqr res ≤ x ∧ x < sqr (res + (1 : ℤ))
end Square
