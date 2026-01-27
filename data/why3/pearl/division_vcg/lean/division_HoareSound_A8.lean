import Why3.Base
open Classical
open Lean4Why3
namespace division_HoareSound_A8
axiom A1 (x : ℤ) (y : ℤ) : x + y = y + x
axiom A2 (x : ℤ) (y : ℤ) : x * y = y * x
axiom A3 (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
axiom A4 (x : ℤ) (y : ℤ) (z : ℤ) : x * y * z = x * (y * z)
axiom A5 (x : ℤ) (y : ℤ) (z : ℤ) : x * (y + z) = x * y + x * z
axiom A6 (y : ℤ) (x : ℤ) (fact0 : y ≤ x) : x - y + y = x
axiom A7 (x : ℤ) : x + (0 : ℤ) = x
theorem A8 (x : ℤ) : x * (0 : ℤ) = (0 : ℤ)
  := sorry
end division_HoareSound_A8
