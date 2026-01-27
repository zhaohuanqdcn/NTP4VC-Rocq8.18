import Why3.Base
import pearl.induction_vcg.lean.induction.Hyps
open Classical
open Lean4Why3
namespace induction_Induction1_base
noncomputable def pr (k : ℤ) := Hyps.p k ∧ Hyps.p (k + (1 : ℤ))
theorem base : pr (0 : ℤ)
  := sorry
end induction_Induction1_base
