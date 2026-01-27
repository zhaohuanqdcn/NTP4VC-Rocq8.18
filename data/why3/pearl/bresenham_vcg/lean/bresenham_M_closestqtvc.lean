import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace bresenham_M_closestqtvc
noncomputable def best (x2 : ℤ) (y2 : ℤ) (x : ℤ) (y : ℤ) := ∀(y' : ℤ), abs (x2 * y - x * y2) ≤ abs (x2 * y' - x * y2)
theorem closest'vc (a : ℤ) (b : ℤ) (c : ℤ) (b' : ℤ) (fact0 : abs ((2 : ℤ) * a * b - (2 : ℤ) * c) ≤ a) : abs (a * b - c) ≤ abs (a * b' - c)
  := sorry
end bresenham_M_closestqtvc
