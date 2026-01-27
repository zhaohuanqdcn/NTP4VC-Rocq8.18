import Why3.Base
open Classical
open Lean4Why3
namespace mccarthy_vc_sp_McCarthy91_f91qtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
theorem f91'vc (n : ℤ) : (n ≤ (100 : ℤ) → (let o1 : ℤ := n + (11 : ℤ); ((0 : ℤ) ≤ (101 : ℤ) - n ∧ (101 : ℤ) - o1 < (101 : ℤ) - n) ∧ (0 : ℤ) ≤ (101 : ℤ) - n ∧ (101 : ℤ) - spec o1 < (101 : ℤ) - n)) ∧ (∀(result : ℤ), (if n ≤ (100 : ℤ) then result = spec (spec (n + (11 : ℤ))) else result = n - (10 : ℤ)) → result = spec n)
  := sorry
end mccarthy_vc_sp_McCarthy91_f91qtvc
