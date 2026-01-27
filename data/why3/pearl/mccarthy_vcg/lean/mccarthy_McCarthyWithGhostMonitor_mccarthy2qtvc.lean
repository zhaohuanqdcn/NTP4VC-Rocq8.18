import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace mccarthy_McCarthyWithGhostMonitor_mccarthy2qtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
theorem mccarthy2'vc (n : ℤ) (r : ℤ) (e : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < (3 : ℤ) ∧ (((0 : ℤ) = (1 : ℤ) ∧ (100 : ℤ) < r → (1 : ℤ) = (2 : ℤ) ∧ n = r - (10 : ℤ) ∧ (1 : ℤ) = e - (1 : ℤ)) ∧ ((0 : ℤ) = (1 : ℤ) ∧ r ≤ (100 : ℤ) → n = r + (11 : ℤ) ∧ (1 : ℤ) = e + (1 : ℤ)) ∧ ((0 : ℤ) = (2 : ℤ) ∧ e = (0 : ℤ) → (1 : ℤ) = (3 : ℤ) ∧ n = r ∧ (1 : ℤ) = e) ∧ ((0 : ℤ) = (2 : ℤ) ∧ ¬e = (0 : ℤ) → n = r ∧ (1 : ℤ) = e) → (0 : ℤ) < (1 : ℤ) ∧ ((0 : ℤ) ≤ (2 : ℤ) ∧ (2 : ℤ) < (3 : ℤ)) ∧ (∀(r1 : ℤ) (e1 : ℤ) (pc : ℤ), ((2 : ℤ) = (0 : ℤ) → pc = (1 : ℤ) ∧ e1 = (1 : ℤ) ∧ r1 = n) ∧ ((2 : ℤ) = (1 : ℤ) ∧ (100 : ℤ) < spec n → pc = (2 : ℤ) ∧ r1 = spec n - (10 : ℤ) ∧ e1 = (1 : ℤ) - (1 : ℤ) - (1 : ℤ)) ∧ ((2 : ℤ) = (1 : ℤ) ∧ spec n ≤ (100 : ℤ) → pc = (1 : ℤ) ∧ r1 = spec n + (11 : ℤ) ∧ e1 = (1 : ℤ) - (1 : ℤ) + (1 : ℤ)) ∧ ((1 : ℤ) - (1 : ℤ) = (0 : ℤ) → pc = (3 : ℤ) ∧ r1 = spec n ∧ e1 = (1 : ℤ) - (1 : ℤ)) ∧ (¬(1 : ℤ) - (1 : ℤ) = (0 : ℤ) → pc = (1 : ℤ) ∧ r1 = spec n ∧ e1 = (1 : ℤ) - (1 : ℤ)) → pc = (3 : ℤ) ∧ r1 = spec n))
  := sorry
end mccarthy_McCarthyWithGhostMonitor_mccarthy2qtvc
