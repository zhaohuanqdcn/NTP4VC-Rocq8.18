import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace rac_Loops_test1qtvc
theorem test1'vc (fact0 : (1 : ℤ) ≤ (10 : ℤ) + (1 : ℤ)) : (0 : ℤ) < (1 : ℤ) ∧ (1 : ℤ) ≤ (10 : ℤ) ∧ (∀(i : ℤ), ((1 : ℤ) ≤ i ∧ i ≤ (10 : ℤ)) ∧ (0 : ℤ) < i ∧ i ≤ (10 : ℤ) → (0 : ℤ) < i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ (10 : ℤ))
  := sorry
end rac_Loops_test1qtvc
