import Why3.Base
import pearl.induction_vcg.lean.induction.Hyps
open Classical
open Lean4Why3
namespace induction_Induction1_G
noncomputable def pr (k : ℤ) := Hyps.p k ∧ Hyps.p (k + (1 : ℤ))
axiom base : pr (0 : ℤ)
axiom induction_step (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : pr n) : pr (n + (1 : ℤ))
axiom SimpleInduction (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : pr n
theorem G (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : Hyps.p n
  := sorry
end induction_Induction1_G
