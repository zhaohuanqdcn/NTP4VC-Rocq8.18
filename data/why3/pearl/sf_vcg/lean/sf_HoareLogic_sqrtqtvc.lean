import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace sf_HoareLogic_sqrtqtvc
inductive even : ℤ -> Prop where
 | even_0 : even (0 : ℤ)
 | even_odd (x : ℤ) : even x → even (x + (2 : ℤ))
theorem sqrt'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) * (0 : ℤ) ≤ x ∧ (∀(z : ℤ), (0 : ℤ) ≤ z ∧ z * z ≤ x → (if (z + (1 : ℤ)) * (z + (1 : ℤ)) ≤ x then ((0 : ℤ) ≤ x - z * z ∧ x - (z + (1 : ℤ)) * (z + (1 : ℤ)) < x - z * z) ∧ (0 : ℤ) ≤ z + (1 : ℤ) ∧ (z + (1 : ℤ)) * (z + (1 : ℤ)) ≤ x else z * z ≤ x ∧ x < (z + (1 : ℤ)) * (z + (1 : ℤ))))
  := sorry
end sf_HoareLogic_sqrtqtvc
