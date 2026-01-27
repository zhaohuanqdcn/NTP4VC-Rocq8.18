import Why3.Base
open Classical
open Lean4Why3
namespace division_HoareSound_A2
axiom A1 (x : ℤ) (y : ℤ) : x + y = y + x
theorem A2 (x : ℤ) (y : ℤ) : x * y = y * x
  := sorry
end division_HoareSound_A2
