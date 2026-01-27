import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
open Classical
open Lean4Why3
namespace mccarthy_vc_sp_McCarthy91_f91_pseudorecqtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
theorem f91_pseudorec'vc (n0 : ℤ) : (∀(e : ℤ), (0 : ℤ) ≤ e → ¬(0 : ℤ) < e → e = (0 : ℤ)) ∧ (∀(e : ℤ) (n : ℤ), (0 : ℤ) < e → ((0 : ℤ) ≤ e ∧ (∀(e1 : ℤ) (n1 : ℤ), ((0 : ℤ) < e ∧ (if (100 : ℤ) < n then n1 = n - (10 : ℤ) ∧ e1 = e - (1 : ℤ) else n1 = n + (11 : ℤ) ∧ e1 = e + (1 : ℤ)) → n ≤ (100 : ℤ) → (((0 : ℤ) ≤ (101 : ℤ) - n ∧ (101 : ℤ) - n1 < (101 : ℤ) - n) ∧ (0 : ℤ) < e1) ∧ ((0 : ℤ) ≤ (101 : ℤ) - n ∧ (101 : ℤ) - spec n1 < (101 : ℤ) - n) ∧ (0 : ℤ) < e1 - (1 : ℤ)) ∧ ¬((e1 = e ∧ e = (0 : ℤ)) ∧ n1 = n))) ∧ (∀(e1 : ℤ) (n1 : ℤ), (∃(e2 : ℤ) (n2 : ℤ), ((0 : ℤ) < e ∧ (if (100 : ℤ) < n then n2 = n - (10 : ℤ) ∧ e2 = e - (1 : ℤ) else n2 = n + (11 : ℤ) ∧ e2 = e + (1 : ℤ))) ∧ (if n ≤ (100 : ℤ) then e1 = e2 - (1 : ℤ) - (1 : ℤ) ∧ n1 = spec (spec n2) else e1 = e2 ∧ n1 = n2)) → e1 = e - (1 : ℤ) ∧ n1 = spec n)) ∧ (0 : ℤ) < (1 : ℤ) ∧ (0 : ℤ) ≤ (1 : ℤ) - (1 : ℤ) ∧ (∀(e : ℤ) (n : ℤ), ¬((0 : ℤ) < (1 : ℤ) - (1 : ℤ) ∧ (if (100 : ℤ) < spec n0 then n = spec n0 - (10 : ℤ) ∧ e = (1 : ℤ) - (1 : ℤ) - (1 : ℤ) else n = spec n0 + (11 : ℤ) ∧ e = (1 : ℤ) - (1 : ℤ) + (1 : ℤ))) ∧ ((e = (1 : ℤ) - (1 : ℤ) ∧ (1 : ℤ) - (1 : ℤ) = (0 : ℤ)) ∧ n = spec n0 → n = spec n0))
  := sorry
end mccarthy_vc_sp_McCarthy91_f91_pseudorecqtvc
