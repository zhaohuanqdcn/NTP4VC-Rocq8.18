import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_conservation_not_marked_impl_next_not_markedqtvc
theorem conservation_not_marked_impl_next_not_marked'vc (marked : List Bool) (nexts : List ℤ) (n : ℤ) (max : ℤ) (fact0 : EulerSieveSpec.not_marked_impl_next_not_marked marked nexts n) (fact1 : n < nexts[Int.toNat n]!) (fact2 : (0 : ℤ) < n) (fact3 : max / nexts[Int.toNat n]! ≤ max / n) : EulerSieveSpec.not_marked_impl_next_not_marked marked nexts (nexts[Int.toNat n]!)
  := sorry
end euler_sieve_EulerSieve_conservation_not_marked_impl_next_not_markedqtvc
