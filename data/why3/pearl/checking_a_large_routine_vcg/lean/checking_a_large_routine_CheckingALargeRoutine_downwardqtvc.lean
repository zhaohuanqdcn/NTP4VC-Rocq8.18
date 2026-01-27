import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fact
open Classical
open Lean4Why3
namespace checking_a_large_routine_CheckingALargeRoutine_downwardqtvc
theorem downward'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ n ∧ n ≤ n ∧ (1 : ℤ) * Fact.fact n = Fact.fact n ∧ (∀(u : ℤ) (r : ℤ), ((0 : ℤ) ≤ r ∧ r ≤ n) ∧ u * Fact.fact r = Fact.fact n → (if ¬r = (0 : ℤ) then (((1 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ r) ∧ u = (1 : ℤ) * u) ∧ (∀(s : ℤ), (1 : ℤ) ≤ s ∧ s ≤ r → (if ¬s = r then ((0 : ℤ) ≤ r - s ∧ r - (s + (1 : ℤ)) < r - s) ∧ ((1 : ℤ) ≤ s + (1 : ℤ) ∧ s + (1 : ℤ) ≤ r) ∧ s * u + u = (s + (1 : ℤ)) * u else ((0 : ℤ) ≤ r ∧ r - (1 : ℤ) < r) ∧ ((0 : ℤ) ≤ r - (1 : ℤ) ∧ r - (1 : ℤ) ≤ n) ∧ s * u * Fact.fact (r - (1 : ℤ)) = Fact.fact n)) else u = Fact.fact n))
  := sorry
end checking_a_large_routine_CheckingALargeRoutine_downwardqtvc
