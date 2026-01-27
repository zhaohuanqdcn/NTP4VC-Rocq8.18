import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace assigning_meanings_to_programs_Division_divisionqtvc
theorem division'vc (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : (0 : ℤ) < y) : (0 : ℤ) ≤ x ∧ x = (0 : ℤ) * y + x ∧ (∀(r : ℤ) (q : ℤ), (0 : ℤ) ≤ r ∧ x = q * y + r → (if y ≤ r then ((0 : ℤ) ≤ r ∧ r - y < r) ∧ (0 : ℤ) ≤ r - y ∧ x = (q + (1 : ℤ)) * y + (r - y) else ((0 : ℤ) ≤ r ∧ r < y) ∧ x = q * y + r))
  := sorry
end assigning_meanings_to_programs_Division_divisionqtvc
