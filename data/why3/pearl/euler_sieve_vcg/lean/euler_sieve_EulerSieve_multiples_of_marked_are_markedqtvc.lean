import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_multiples_of_marked_are_markedqtvc
theorem multiples_of_marked_are_marked'vc (n : ℤ) (marked : List Bool) (k : ℤ) (i : ℤ) (j : ℤ) (fact0 : (2 : ℤ) ≤ n) (fact1 : n ≤ Int.ofNat (List.length marked)) (fact2 : EulerSieveSpec.previously_marked_multiples marked n) (fact3 : (2 : ℤ) ≤ k) (fact4 : k < n) (fact5 : (2 : ℤ) ≤ i) (fact6 : i < Int.ofNat (List.length marked)) (fact7 : k * i < Int.ofNat (List.length marked)) (fact8 : (1 : ℤ) ≤ j) (fact9 : j < Int.ofNat (List.length marked)) (fact10 : k * i * j < Int.ofNat (List.length marked)) : marked[Int.toNat (k * i * j)]! = true
  := sorry
end euler_sieve_EulerSieve_multiples_of_marked_are_markedqtvc
