import Why3.Base
open Classical
open Lean4Why3
namespace func_literals_Top_g1
axiom fc : ℤ -> ℤ
axiom fc1 : ℤ -> ℤ
axiom fc'def (x'x : ℤ) : fc x'x = (if x'x = (0 : ℤ) then (1 : ℤ) else (1 : ℤ))
axiom fc'def1 (x'x : ℤ) : fc1 x'x = (if x'x = (1 : ℤ) then (2 : ℤ) else (2 : ℤ))
theorem g1 : let a : ℤ -> ℤ := fc; let b : ℤ -> ℤ := fc1; (1 : ℤ) = a (1 : ℤ) ∧ ¬a (1 : ℤ) = b (1 : ℤ) ∧ b (1 : ℤ) = (2 : ℤ)
  := sorry
end func_literals_Top_g1
