import Why3.Base
import pearl.induction_vcg.lean.induction.Hyps
open Classical
open Lean4Why3
namespace induction_Induction1_induction_step
noncomputable def pr (k : ℤ) := Hyps.p k ∧ Hyps.p (k + (1 : ℤ))
axiom base : pr (0 : ℤ)
theorem induction_step (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : pr n) : pr (n + (1 : ℤ))
  := sorry
end induction_Induction1_induction_step
