import Why3.Base
open Classical
open Lean4Why3
namespace division_HoareSound_A3
axiom A1 (x : ℤ) (y : ℤ) : x + y = y + x
axiom A2 (x : ℤ) (y : ℤ) : x * y = y * x
theorem A3 (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
  := sorry
end division_HoareSound_A3
