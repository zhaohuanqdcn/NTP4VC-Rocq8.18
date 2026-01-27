import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.relations.WellFounded
open Classical
open Lean4Why3
namespace rac_Variants_loop_custom_variantqtvc
noncomputable def p (i : ℤ) (i_old : ℤ) := i_old ≤ (2 : ℤ) ∧ i_old < i
axiom p_closure : ℤ -> ℤ -> Bool
axiom p_closure_def (y : ℤ) (y1 : ℤ) : (p_closure y y1 = true) = p y y1
theorem loop_custom_variant'vc (i : ℤ) : if (0 : ℤ) ≤ i then p ((2 : ℤ) - (i - (1 : ℤ))) ((2 : ℤ) - i) ∧ WellFounded.acc p_closure ((2 : ℤ) - i) else ∀(i1 : ℤ), -(1 : ℤ) ≤ i1 → p ((2 : ℤ) - (i1 - (1 : ℤ))) ((2 : ℤ) - i1) ∧ WellFounded.acc p_closure ((2 : ℤ) - i1)
  := sorry
end rac_Variants_loop_custom_variantqtvc
