import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace sf_HoareLogic_parityqtvc
inductive even : ℤ -> Prop where
 | even_0 : even (0 : ℤ)
 | even_odd (x : ℤ) : even x → even (x + (2 : ℤ))
theorem parity'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ x ∧ (even (x - x) ∨ (0 : ℤ) = (1 : ℤ) ∧ even (x - x + (1 : ℤ))) ∧ (∀(y : ℤ) (x1 : ℤ), (0 : ℤ) ≤ x1 ∧ (y = (0 : ℤ) ∧ even (x - x1) ∨ y = (1 : ℤ) ∧ even (x - x1 + (1 : ℤ))) → (if ¬x1 = (0 : ℤ) then ((0 : ℤ) ≤ x1 ∧ x1 - (1 : ℤ) < x1) ∧ (0 : ℤ) ≤ x1 - (1 : ℤ) ∧ ((1 : ℤ) - y = (0 : ℤ) ∧ even (x - (x1 - (1 : ℤ))) ∨ (1 : ℤ) - y = (1 : ℤ) ∧ even (x - (x1 - (1 : ℤ)) + (1 : ℤ))) else (y = (0 : ℤ)) = even x))
  := sorry
end sf_HoareLogic_parityqtvc
