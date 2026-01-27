import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace rac_Variants_loop_var_fail1qtvc
theorem loop_var_fail1'vc (i : ℤ) (fact0 : (0 : ℤ) ≤ i) : if (1 : ℤ) < i then (0 : ℤ) ≤ i ∧ i - (1 : ℤ) < i else (0 : ℤ) ≤ i ∧ i < i
  := sorry
end rac_Variants_loop_var_fail1qtvc
