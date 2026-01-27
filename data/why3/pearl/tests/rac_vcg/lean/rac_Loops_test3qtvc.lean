import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace rac_Loops_test3qtvc
theorem test3'vc (x : ℤ) : x ≤ (5 : ℤ) ∧ (∀(x1 : ℤ), x1 ≤ (5 : ℤ) → x1 < (10 : ℤ) → ((0 : ℤ) ≤ (10 : ℤ) - x1 ∧ (10 : ℤ) - (x1 + (1 : ℤ)) < (10 : ℤ) - x1) ∧ x1 + (1 : ℤ) ≤ (5 : ℤ))
  := sorry
end rac_Loops_test3qtvc
