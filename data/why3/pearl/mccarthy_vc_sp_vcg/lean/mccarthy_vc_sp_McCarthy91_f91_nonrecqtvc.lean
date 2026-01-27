import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
open Classical
open Lean4Why3
namespace mccarthy_vc_sp_McCarthy91_f91_nonrecqtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
axiom spec_closure : ℤ -> ℤ
axiom spec_closure_def (y : ℤ) : spec_closure y = spec y
theorem f91_nonrec'vc (n0 : ℤ) : (0 : ℤ) ≤ (1 : ℤ) ∧ Iter.iter spec_closure (1 : ℤ) n0 = spec n0 ∧ (∀(e : ℤ) (n : ℤ), (0 : ℤ) ≤ e ∧ Iter.iter spec_closure e n = spec n0 → (if (0 : ℤ) < e then ∀(e1 : ℤ) (n1 : ℤ), (if (100 : ℤ) < n then n1 = n - (10 : ℤ) ∧ e1 = e - (1 : ℤ) else n1 = n + (11 : ℤ) ∧ e1 = e + (1 : ℤ)) → ((0 : ℤ) ≤ (101 : ℤ) - n + (10 : ℤ) * e ∧ (101 : ℤ) - n1 + (10 : ℤ) * e1 < (101 : ℤ) - n + (10 : ℤ) * e ∨ (101 : ℤ) - n + (10 : ℤ) * e = (101 : ℤ) - n1 + (10 : ℤ) * e1 ∧ (0 : ℤ) ≤ e ∧ e1 < e) ∧ (0 : ℤ) ≤ e1 ∧ Iter.iter spec_closure e1 n1 = spec n0 else n = spec n0))
  := sorry
end mccarthy_vc_sp_McCarthy91_f91_nonrecqtvc
