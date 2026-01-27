import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fact
open Classical
open Lean4Why3
namespace checking_a_large_routine_CheckingALargeRoutine_routineqtvc
theorem routine'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ n ∧ (1 : ℤ) = Fact.fact (0 : ℤ) ∧ (∀(r : ℤ), (0 : ℤ) ≤ r ∧ r ≤ n → (if r < n then (((1 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ r + (1 : ℤ)) ∧ Fact.fact r = (1 : ℤ) * Fact.fact r) ∧ (∀(s : ℤ), (1 : ℤ) ≤ s ∧ s ≤ r + (1 : ℤ) → (if s ≤ r then ((0 : ℤ) ≤ r - s ∧ r - (s + (1 : ℤ)) < r - s) ∧ ((1 : ℤ) ≤ s + (1 : ℤ) ∧ s + (1 : ℤ) ≤ r + (1 : ℤ)) ∧ s * Fact.fact r + Fact.fact r = (s + (1 : ℤ)) * Fact.fact r else ((0 : ℤ) ≤ n - r ∧ n - (r + (1 : ℤ)) < n - r) ∧ ((0 : ℤ) ≤ r + (1 : ℤ) ∧ r + (1 : ℤ) ≤ n) ∧ s * Fact.fact r = Fact.fact (r + (1 : ℤ)))) else Fact.fact r = Fact.fact n))
  := sorry
end checking_a_large_routine_CheckingALargeRoutine_routineqtvc
