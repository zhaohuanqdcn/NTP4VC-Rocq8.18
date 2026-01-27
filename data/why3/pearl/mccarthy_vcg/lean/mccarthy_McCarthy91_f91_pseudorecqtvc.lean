import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
open Classical
open Lean4Why3
namespace mccarthy_McCarthy91_f91_pseudorecqtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
theorem f91_pseudorec'vc (n0 : ℤ) : (∀(n : ℤ) (e : ℤ), (0 : ℤ) ≤ e → (if ¬(0 : ℤ) < e then e = (0 : ℤ) else if (100 : ℤ) < n then (0 : ℤ) < e ∧ (if (100 : ℤ) < n then True else n - (10 : ℤ) = n + (11 : ℤ) ∧ e - (1 : ℤ) = e + (1 : ℤ)) else (0 : ℤ) < e ∧ (if (100 : ℤ) < n then n + (11 : ℤ) = n - (10 : ℤ) ∧ e + (1 : ℤ) = e - (1 : ℤ) else True))) ∧ (∀(n : ℤ) (e : ℤ), (0 : ℤ) < e → (0 : ℤ) ≤ e ∧ (∀(n1 : ℤ) (e1 : ℤ), ((0 : ℤ) < e ∧ (if (100 : ℤ) < n then n1 = n - (10 : ℤ) ∧ e1 = e - (1 : ℤ) else n1 = n + (11 : ℤ) ∧ e1 = e + (1 : ℤ)) → (if n ≤ (100 : ℤ) then (((0 : ℤ) ≤ (101 : ℤ) - n ∧ (101 : ℤ) - n1 < (101 : ℤ) - n) ∧ (0 : ℤ) < e1) ∧ (((0 : ℤ) ≤ (101 : ℤ) - n ∧ (101 : ℤ) - spec n1 < (101 : ℤ) - n) ∧ (0 : ℤ) < e1 - (1 : ℤ)) ∧ e1 - (1 : ℤ) - (1 : ℤ) = e - (1 : ℤ) ∧ spec (spec n1) = spec n else e1 = e - (1 : ℤ) ∧ n1 = spec n)) ∧ ¬((e1 = e ∧ e = (0 : ℤ)) ∧ n1 = n))) ∧ (0 : ℤ) < (1 : ℤ) ∧ (0 : ℤ) ≤ (1 : ℤ) - (1 : ℤ) ∧ (∀(n : ℤ) (e : ℤ), ¬((0 : ℤ) < (1 : ℤ) - (1 : ℤ) ∧ (if (100 : ℤ) < spec n0 then n = spec n0 - (10 : ℤ) ∧ e = (1 : ℤ) - (1 : ℤ) - (1 : ℤ) else n = spec n0 + (11 : ℤ) ∧ e = (1 : ℤ) - (1 : ℤ) + (1 : ℤ))) ∧ ((e = (1 : ℤ) - (1 : ℤ) ∧ (1 : ℤ) - (1 : ℤ) = (0 : ℤ)) ∧ n = spec n0 → n = spec n0))
  := sorry
end mccarthy_McCarthy91_f91_pseudorecqtvc
