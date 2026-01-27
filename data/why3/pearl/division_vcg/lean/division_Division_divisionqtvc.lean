import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace division_Division_divisionqtvc
theorem division'vc (a : ℤ) (b : ℤ) (fact0 : (0 : ℤ) ≤ a) (fact1 : (0 : ℤ) < b) : (0 : ℤ) * b + a = a ∧ (0 : ℤ) ≤ a ∧ (∀(r : ℤ) (q : ℤ), q * b + r = a ∧ (0 : ℤ) ≤ r → (if b ≤ r then ((0 : ℤ) ≤ r ∧ r - b < r) ∧ (q + (1 : ℤ)) * b + (r - b) = a ∧ (0 : ℤ) ≤ r - b else ∃(r1 : ℤ), q * b + r1 = a ∧ (0 : ℤ) ≤ r1 ∧ r1 < b))
  := sorry
end division_Division_divisionqtvc
