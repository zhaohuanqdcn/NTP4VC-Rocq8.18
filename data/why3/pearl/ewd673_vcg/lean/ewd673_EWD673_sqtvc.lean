import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace ewd673_EWD673_sqtvc
theorem s'vc (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : (0 : ℤ) ≤ y) : (0 : ℤ) ≤ x ∧ (0 : ℤ) ≤ y ∧ (∀(y1 : ℤ) (x1 : ℤ), (0 : ℤ) ≤ x1 ∧ (0 : ℤ) ≤ y1 → (if (0 : ℤ) < x1 then True else true = (if (0 : ℤ) < y1 then true else false)) → (if (0 : ℤ) < x1 then ∀(o1 : ℤ), (0 : ℤ) ≤ o1 → (if (0 : ℤ) < o1 then ((0 : ℤ) ≤ x1 ∧ x1 - (1 : ℤ) < x1 ∨ x1 = x1 - (1 : ℤ) ∧ (0 : ℤ) ≤ y1 ∧ o1 - (1 : ℤ) < y1) ∧ (0 : ℤ) ≤ x1 - (1 : ℤ) ∧ (0 : ℤ) ≤ o1 - (1 : ℤ) else ((0 : ℤ) ≤ x1 ∧ x1 - (1 : ℤ) < x1 ∨ x1 = x1 - (1 : ℤ) ∧ (0 : ℤ) ≤ y1 ∧ o1 < y1) ∧ (0 : ℤ) ≤ x1 - (1 : ℤ) ∧ (0 : ℤ) ≤ o1) else if (0 : ℤ) < y1 then ((0 : ℤ) ≤ x1 ∧ x1 < x1 ∨ (0 : ℤ) ≤ y1 ∧ y1 - (1 : ℤ) < y1) ∧ (0 : ℤ) ≤ x1 ∧ (0 : ℤ) ≤ y1 - (1 : ℤ) else ((0 : ℤ) ≤ x1 ∧ x1 < x1 ∨ (0 : ℤ) ≤ y1 ∧ y1 < y1) ∧ (0 : ℤ) ≤ x1 ∧ (0 : ℤ) ≤ y1))
  := sorry
end ewd673_EWD673_sqtvc
