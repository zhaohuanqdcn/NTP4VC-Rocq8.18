import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace mccarthy_McCarthyWithGhostMonitor_monitor2qtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
theorem monitor2'vc (e : ℤ) (n : ℤ) (r1 : ℤ) (fact0 : (0 : ℤ) < e) : (0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < (3 : ℤ) ∧ (∀(r : ℤ) (e1 : ℤ) (pc : ℤ), ((1 : ℤ) = (0 : ℤ) → pc = (1 : ℤ) ∧ e1 = (1 : ℤ) ∧ r = n) ∧ ((100 : ℤ) < r1 → pc = (2 : ℤ) ∧ r = r1 - (10 : ℤ) ∧ e1 = e - (1 : ℤ)) ∧ (r1 ≤ (100 : ℤ) → pc = (1 : ℤ) ∧ r = r1 + (11 : ℤ) ∧ e1 = e + (1 : ℤ)) ∧ ((1 : ℤ) = (2 : ℤ) ∧ e = (0 : ℤ) → pc = (3 : ℤ) ∧ r = r1 ∧ e1 = e) ∧ ((1 : ℤ) = (2 : ℤ) ∧ ¬e = (0 : ℤ) → pc = (1 : ℤ) ∧ r = r1 ∧ e1 = e) → (if ¬pc = (2 : ℤ) then (((0 : ℤ) ≤ (101 : ℤ) - r1 ∧ (101 : ℤ) - r < (101 : ℤ) - r1) ∧ pc = (1 : ℤ) ∧ (0 : ℤ) < e1) ∧ ((0 : ℤ) ≤ (2 : ℤ) ∧ (2 : ℤ) < (3 : ℤ)) ∧ (∀(r2 : ℤ) (e2 : ℤ) (pc1 : ℤ), ((2 : ℤ) = (0 : ℤ) → pc1 = (1 : ℤ) ∧ e2 = (1 : ℤ) ∧ r2 = n) ∧ ((2 : ℤ) = (1 : ℤ) ∧ (100 : ℤ) < spec r → pc1 = (2 : ℤ) ∧ r2 = spec r - (10 : ℤ) ∧ e2 = e1 - (1 : ℤ) - (1 : ℤ)) ∧ ((2 : ℤ) = (1 : ℤ) ∧ spec r ≤ (100 : ℤ) → pc1 = (1 : ℤ) ∧ r2 = spec r + (11 : ℤ) ∧ e2 = e1 - (1 : ℤ) + (1 : ℤ)) ∧ (e1 - (1 : ℤ) = (0 : ℤ) → pc1 = (3 : ℤ) ∧ r2 = spec r ∧ e2 = e1 - (1 : ℤ)) ∧ (¬e1 - (1 : ℤ) = (0 : ℤ) → pc1 = (1 : ℤ) ∧ r2 = spec r ∧ e2 = e1 - (1 : ℤ)) → (((0 : ℤ) ≤ (101 : ℤ) - r1 ∧ (101 : ℤ) - r2 < (101 : ℤ) - r1) ∧ pc1 = (1 : ℤ) ∧ (0 : ℤ) < e2) ∧ spec r2 = spec r1 ∧ e2 - (1 : ℤ) = e - (1 : ℤ)) else pc = (2 : ℤ) ∧ r = spec r1 ∧ e1 = e - (1 : ℤ)))
  := sorry
end mccarthy_McCarthyWithGhostMonitor_monitor2qtvc
