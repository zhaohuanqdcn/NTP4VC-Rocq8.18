import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace rac_Variants_loop_var_ok2qtvc
theorem loop_var_ok2'vc (j : ℤ) (i : ℤ) (fact0 : (0 : ℤ) ≤ j) : if (0 : ℤ) < i then (0 : ℤ) ≤ i ∧ i - (1 : ℤ) < i ∨ i = i - (1 : ℤ) ∧ (0 : ℤ) ≤ j ∧ j < j else (0 : ℤ) ≤ i ∧ i < i ∨ (0 : ℤ) ≤ j ∧ j - (1 : ℤ) < j
  := sorry
end rac_Variants_loop_var_ok2qtvc
