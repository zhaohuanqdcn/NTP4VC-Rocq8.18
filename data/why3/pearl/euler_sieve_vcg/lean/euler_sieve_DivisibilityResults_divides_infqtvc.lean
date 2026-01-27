import Why3.Base
open Classical
open Lean4Why3
namespace euler_sieve_DivisibilityResults_divides_infqtvc
theorem divides_inf'vc (n : ℤ) (m : ℤ) (k : ℤ) (fact0 : (2 : ℤ) ≤ n) (fact1 : (2 : ℤ) ≤ m) (fact2 : n ∣  m) (fact3 : ∀(k : ℤ), (2 : ℤ) ≤ k ∧ k < n → ¬k ∣  m) (fact4 : (2 : ℤ) ≤ k) (fact5 : k < n) : ¬k ∣  m / n
  := sorry
end euler_sieve_DivisibilityResults_divides_infqtvc
