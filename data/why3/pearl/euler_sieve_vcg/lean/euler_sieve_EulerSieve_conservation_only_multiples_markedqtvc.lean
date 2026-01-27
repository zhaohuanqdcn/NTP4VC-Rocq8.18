import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_conservation_only_multiples_markedqtvc
theorem conservation_only_multiples_marked'vc (i : ℤ) (n : ℤ) (j : ℤ) (marked : List Bool) (fact0 : (2 : ℤ) ≤ i) (fact1 : i < n) (fact2 : (2 : ℤ) ≤ j) (fact3 : j < Int.ofNat (List.length marked)) (fact4 : i * j < Int.ofNat (List.length marked)) (fact5 : EulerSieveSpec.only_multiples_marked marked n) : EulerSieveSpec.only_multiples_marked (List.set marked (Int.toNat (i * j)) true) n
  := sorry
end euler_sieve_EulerSieve_conservation_only_multiples_markedqtvc
