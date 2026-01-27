import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace rac_Loops_test2qtvc
theorem test2'vc (fact0 : (0 : ℤ) ≤ (5 : ℤ) + (1 : ℤ)) : (True ∨ (0 : ℤ) = (1 : ℤ)) ∧ (∀(x : ℤ) (i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ (5 : ℤ)) ∧ (x = (0 : ℤ) ∨ x = (1 : ℤ)) → x + (1 : ℤ) = (0 : ℤ) ∨ x + (1 : ℤ) = (1 : ℤ))
  := sorry
end rac_Loops_test2qtvc
