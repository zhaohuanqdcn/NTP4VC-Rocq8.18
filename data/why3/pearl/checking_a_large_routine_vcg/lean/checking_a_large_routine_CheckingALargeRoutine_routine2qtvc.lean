import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fact
open Classical
open Lean4Why3
namespace checking_a_large_routine_CheckingALargeRoutine_routine2qtvc
theorem routine2'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (1 : ℤ) = Fact.fact (0 : ℤ) ∧ (∀(u : ℤ), (∀(r : ℤ), ((0 : ℤ) ≤ r ∧ r ≤ o1) ∧ u = Fact.fact r → ((1 : ℤ) ≤ r + (1 : ℤ) → u = (1 : ℤ) * Fact.fact r ∧ (∀(u1 : ℤ), (∀(s : ℤ), ((1 : ℤ) ≤ s ∧ s ≤ r) ∧ u1 = s * Fact.fact r → u1 + u = (s + (1 : ℤ)) * Fact.fact r) ∧ (u1 = (r + (1 : ℤ)) * Fact.fact r → u1 = Fact.fact (r + (1 : ℤ))))) ∧ (r + (1 : ℤ) < (1 : ℤ) → u = Fact.fact (r + (1 : ℤ)))) ∧ (u = Fact.fact (o1 + (1 : ℤ)) → u = Fact.fact n))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → (1 : ℤ) = Fact.fact n)
  := sorry
end checking_a_large_routine_CheckingALargeRoutine_routine2qtvc
