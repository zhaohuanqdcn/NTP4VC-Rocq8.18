import Why3.Base
open Classical
open Lean4Why3
namespace euler_sieve_DivisibilityResults_not_prime_divider_limitsqtvc
theorem not_prime_divider_limits'vc (n : ℤ) (fact0 : ¬Nat.Prime (Int.toNat n)) (fact1 : (2 : ℤ) ≤ n) : ∃(i : ℤ), (2 : ℤ) ≤ i ∧ i * i ≤ n ∧ i ∣  n
  := sorry
end euler_sieve_DivisibilityResults_not_prime_divider_limitsqtvc
