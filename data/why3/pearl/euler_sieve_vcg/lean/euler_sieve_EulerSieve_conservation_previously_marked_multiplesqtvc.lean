import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_conservation_previously_marked_multiplesqtvc
theorem conservation_previously_marked_multiples'vc (n : ℤ) (marked : List Bool) (nexts : List ℤ) (fact0 : (2 : ℤ) ≤ n) (fact1 : n < Int.ofNat (List.length marked)) (fact2 : List.length marked = List.length nexts) (fact3 : nexts[Int.toNat n]! ≤ Int.ofNat (List.length marked)) (fact4 : EulerSieveSpec.previously_marked_multiples marked n) (fact5 : EulerSieveSpec.only_multiples_marked marked (n + (1 : ℤ))) (fact6 : EulerSieveSpec.all_eliminated_marked marked nexts) (fact7 : EulerSieveSpec.not_marked_impl_next_not_marked marked nexts (nexts[Int.toNat n]!)) (fact8 : EulerSieveSpec.all_multiples_marked marked n (Int.ofNat (List.length marked))) : EulerSieveSpec.previously_marked_multiples marked (nexts[Int.toNat n]!)
  := sorry
end euler_sieve_EulerSieve_conservation_previously_marked_multiplesqtvc
