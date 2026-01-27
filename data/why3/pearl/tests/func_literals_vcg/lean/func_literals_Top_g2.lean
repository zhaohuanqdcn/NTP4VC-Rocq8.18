import Why3.Base
open Classical
open Lean4Why3
namespace func_literals_Top_g2
axiom fc : ℤ -> ℤ
axiom fc1 : ℤ -> ℤ
axiom fc2 : ℤ -> ℤ
axiom fc'def (x'x : ℤ) : fc x'x = (if x'x = (0 : ℤ) then (1 : ℤ) else if x'x = (1 : ℤ) then (42 : ℤ) else (42 : ℤ))
axiom fc'def1 (x'x : ℤ) : fc1 x'x = (if x'x = (0 : ℤ) then (1 : ℤ) else if x'x = (1 : ℤ) then (42 : ℤ) else (42 : ℤ))
axiom fc'def2 (x'x : ℤ) : fc2 x'x = (if x'x = (1 : ℤ) then (2 : ℤ) else if x'x = (9 : ℤ) then (42 : ℤ) else (42 : ℤ))
theorem g2 (x : ℤ) (y : ℤ) (fact0 : (1 : ℤ) < x) (fact1 : (1 : ℤ) < y) : fc1 x = fc2 y
  := sorry
end func_literals_Top_g2
