import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace bresenham_M_bresenhamqtvc
noncomputable def best (x2 : ℤ) (y2 : ℤ) (x : ℤ) (y : ℤ) := ∀(y' : ℤ), abs (x2 * y - x * y2) ≤ abs (x2 * y' - x * y2)
theorem bresenham'vc (y2 : ℤ) (x2 : ℤ) (fact0 : (0 : ℤ) ≤ y2) (fact1 : y2 ≤ x2) : let o1 : ℤ := (2 : ℤ) * y2 - x2; (0 : ℤ) ≤ x2 + (1 : ℤ) → (o1 = (2 : ℤ) * ((0 : ℤ) + (1 : ℤ)) * y2 - ((2 : ℤ) * (0 : ℤ) + (1 : ℤ)) * x2 ∧ (2 : ℤ) * (y2 - x2) ≤ o1 ∧ o1 ≤ (2 : ℤ) * y2) ∧ (∀(e : ℤ) (y : ℤ) (x : ℤ), ((0 : ℤ) ≤ x ∧ x ≤ x2) ∧ e = (2 : ℤ) * (x + (1 : ℤ)) * y2 - ((2 : ℤ) * y + (1 : ℤ)) * x2 ∧ (2 : ℤ) * (y2 - x2) ≤ e ∧ e ≤ (2 : ℤ) * y2 → (if e < (0 : ℤ) then e + (2 : ℤ) * y2 = (2 : ℤ) * (x + (1 : ℤ) + (1 : ℤ)) * y2 - ((2 : ℤ) * y + (1 : ℤ)) * x2 ∧ (2 : ℤ) * (y2 - x2) ≤ e + (2 : ℤ) * y2 ∧ e + (2 : ℤ) * y2 ≤ (2 : ℤ) * y2 else e + (2 : ℤ) * (y2 - x2) = (2 : ℤ) * (x + (1 : ℤ) + (1 : ℤ)) * y2 - ((2 : ℤ) * (y + (1 : ℤ)) + (1 : ℤ)) * x2 ∧ (2 : ℤ) * (y2 - x2) ≤ e + (2 : ℤ) * (y2 - x2) ∧ e + (2 : ℤ) * (y2 - x2) ≤ (2 : ℤ) * y2))
  := sorry
end bresenham_M_bresenhamqtvc
