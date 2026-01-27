import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace mccarthy_McCarthy91_f91_tcoqtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
theorem f91_tco'vc (n0 : ℤ) : ((100 : ℤ) < n0 ∨ n0 ≤ n0 ∧ n0 ≤ (101 : ℤ)) ∧ (∀(n : ℤ), n = n0 ∧ (100 : ℤ) < n0 ∨ n0 ≤ n ∧ n ≤ (101 : ℤ) → (if n ≤ (100 : ℤ) then let o1 : ℤ := n + (11 : ℤ); ((0 : ℤ) ≤ (101 : ℤ) - n0 ∧ (101 : ℤ) - o1 < (101 : ℤ) - n0) ∧ ((0 : ℤ) ≤ (101 : ℤ) - n ∧ (101 : ℤ) - spec o1 < (101 : ℤ) - n) ∧ (spec o1 = n0 ∧ (100 : ℤ) < n0 ∨ n0 ≤ spec o1 ∧ spec o1 ≤ (101 : ℤ)) else n - (10 : ℤ) = spec n0))
  := sorry
end mccarthy_McCarthy91_f91_tcoqtvc
