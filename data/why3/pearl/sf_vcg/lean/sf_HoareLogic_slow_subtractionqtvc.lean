import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace sf_HoareLogic_slow_subtractionqtvc
theorem slow_subtraction'vc (x : ℤ) (z1 : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ x ∧ (∀(z : ℤ) (x1 : ℤ), (0 : ℤ) ≤ x1 ∧ z - x1 = z1 - x → (if ¬x1 = (0 : ℤ) then ((0 : ℤ) ≤ x1 ∧ x1 - (1 : ℤ) < x1) ∧ (0 : ℤ) ≤ x1 - (1 : ℤ) ∧ z - (1 : ℤ) - (x1 - (1 : ℤ)) = z1 - x else z = z1 - x))
  := sorry
end sf_HoareLogic_slow_subtractionqtvc
