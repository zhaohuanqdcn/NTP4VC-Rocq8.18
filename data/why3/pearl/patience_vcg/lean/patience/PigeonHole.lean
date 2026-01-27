import Why3.Base
open Classical
open Lean4Why3
namespace PigeonHole
noncomputable def range (f : ℤ -> ℤ) (n : ℤ) (m : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ f i ∧ f i < m
noncomputable def injective (f : ℤ -> ℤ) (n : ℤ) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < n → ¬f i = f j
axiom shift : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom shift'def (f : ℤ -> ℤ) (i : ℤ) (k : ℤ) : shift f i k = (if k < i then f k else f (k + (1 : ℤ)))
end PigeonHole
