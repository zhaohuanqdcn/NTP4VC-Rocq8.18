import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace sf_HoareLogic_reduce_to_zeroqtvc
theorem reduce_to_zero'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ x ∧ (∀(x1 : ℤ), (0 : ℤ) ≤ x1 → (if ¬x1 = (0 : ℤ) then ((0 : ℤ) ≤ x1 ∧ x1 - (1 : ℤ) < x1) ∧ (0 : ℤ) ≤ x1 - (1 : ℤ) else x1 = (0 : ℤ)))
  := sorry
end sf_HoareLogic_reduce_to_zeroqtvc
