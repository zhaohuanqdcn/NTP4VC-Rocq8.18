import Why3.Base
import pearl.induction_vcg.lean.induction.Hyps
open Classical
open Lean4Why3
namespace induction_Induction2_G
axiom Induction (n : ℤ) (fact0 : ∀(n : ℤ), (0 : ℤ) ≤ n → (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n → Hyps.p k) → Hyps.p n) (fact1 : (0 : ℤ) ≤ n) : Hyps.p n
axiom Induction_bound (n : ℤ) (fact0 : ∀(n : ℤ), (0 : ℤ) ≤ n → (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n → Hyps.p k) → Hyps.p n) (fact1 : (0 : ℤ) ≤ n) : Hyps.p n
theorem G (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : Hyps.p n
  := sorry
end induction_Induction2_G
