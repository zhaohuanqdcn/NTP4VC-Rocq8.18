import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
open Classical
open Lean4Why3
namespace euler_sieve_DivisibilityResults_not_prime_impl_divisor_under_sqrtqtvc
theorem not_prime_impl_divisor_under_sqrt'vc (n : ℤ) (i : ℤ) (fact0 : (2 : ℤ) ≤ n) (fact1 : (2 : ℤ) ≤ i) (fact2 : i < n * n) (fact3 : ¬Nat.Prime (Int.toNat i)) : ∃(j : ℤ), ((2 : ℤ) ≤ j ∧ j < i) ∧ j < n ∧ j ∣  i
  := sorry
end euler_sieve_DivisibilityResults_not_prime_impl_divisor_under_sqrtqtvc
