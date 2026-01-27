import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_conservation_previously_marked_multiples_on_marked_changeqtvc
theorem conservation_previously_marked_multiples_on_marked_change'vc (marked : List Bool) (n : ℤ) (i : ℤ) (fact0 : EulerSieveSpec.previously_marked_multiples marked n) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < Int.ofNat (List.length marked)) : EulerSieveSpec.previously_marked_multiples (List.set marked (Int.toNat i) true) n
  := sorry
end euler_sieve_EulerSieve_conservation_previously_marked_multiples_on_marked_changeqtvc
