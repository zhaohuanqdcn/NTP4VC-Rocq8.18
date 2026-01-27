import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
open Classical
open Lean4Why3
namespace mccarthy_McCarthy91_f91_nonrecqtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
axiom spec_closure : ℤ -> ℤ
axiom spec_closure_def (y : ℤ) : spec_closure y = spec y
theorem f91_nonrec'vc (n0 : ℤ) : (0 : ℤ) ≤ (1 : ℤ) ∧ Iter.iter spec_closure (1 : ℤ) n0 = spec n0 ∧ (∀(n : ℤ) (e : ℤ), (0 : ℤ) ≤ e ∧ Iter.iter spec_closure e n = spec n0 → (if (0 : ℤ) < e then if (100 : ℤ) < n then ((0 : ℤ) ≤ (101 : ℤ) - n + (10 : ℤ) * e ∧ (101 : ℤ) - (n - (10 : ℤ)) + (10 : ℤ) * (e - (1 : ℤ)) < (101 : ℤ) - n + (10 : ℤ) * e ∨ (101 : ℤ) - n + (10 : ℤ) * e = (101 : ℤ) - (n - (10 : ℤ)) + (10 : ℤ) * (e - (1 : ℤ)) ∧ (0 : ℤ) ≤ e ∧ e - (1 : ℤ) < e) ∧ (0 : ℤ) ≤ e - (1 : ℤ) ∧ Iter.iter spec_closure (e - (1 : ℤ)) (n - (10 : ℤ)) = spec n0 else ((0 : ℤ) ≤ (101 : ℤ) - n + (10 : ℤ) * e ∧ (101 : ℤ) - (n + (11 : ℤ)) + (10 : ℤ) * (e + (1 : ℤ)) < (101 : ℤ) - n + (10 : ℤ) * e ∨ (101 : ℤ) - n + (10 : ℤ) * e = (101 : ℤ) - (n + (11 : ℤ)) + (10 : ℤ) * (e + (1 : ℤ)) ∧ (0 : ℤ) ≤ e ∧ e + (1 : ℤ) < e) ∧ (0 : ℤ) ≤ e + (1 : ℤ) ∧ Iter.iter spec_closure (e + (1 : ℤ)) (n + (11 : ℤ)) = spec n0 else n = spec n0))
  := sorry
end mccarthy_McCarthy91_f91_nonrecqtvc
