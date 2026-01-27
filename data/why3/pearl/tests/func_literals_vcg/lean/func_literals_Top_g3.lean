import Why3.Base
open Classical
open Lean4Why3
namespace func_literals_Top_g3
axiom fc : ℤ -> ℤ
axiom fc1 : ℤ -> ℤ
axiom fc'def (x'x : ℤ) : fc x'x = (if x'x = (0 : ℤ) then (1 : ℤ) else if x'x = (1 : ℤ) then (2 : ℤ) else (2 : ℤ))
axiom fc'def1 (x'x : ℤ) : fc1 x'x = (if x'x = (0 : ℤ) then (1 : ℤ) else if x'x = (1 : ℤ) then -(2 : ℤ) else -(2 : ℤ))
theorem g3 : let a : ℤ -> ℤ := fc; let b : ℤ -> ℤ := fc1; a (0 : ℤ) = b (0 : ℤ) ∧ a (1 : ℤ) = -b (1 : ℤ) ∧ a (2 : ℤ) = -b (3 : ℤ) ∧ a (3 : ℤ) = -b (3 : ℤ) ∧ ¬a (3 : ℤ) = b (3 : ℤ)
  := sorry
end func_literals_Top_g3
