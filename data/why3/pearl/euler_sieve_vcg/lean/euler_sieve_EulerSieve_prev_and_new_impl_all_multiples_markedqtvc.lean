import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_prev_and_new_impl_all_multiples_markedqtvc
theorem prev_and_new_impl_all_multiples_marked'vc (n : ℤ) (marked : List Bool) (max : ℤ) (marked_old : List Bool) (fact0 : (2 : ℤ) ≤ n) (fact1 : n < Int.ofNat (List.length marked)) (fact2 : (2 : ℤ) ≤ max) (fact3 : max < Int.ofNat (List.length marked)) (fact4 : List.length marked_old = List.length marked) (fact5 : EulerSieveSpec.is_copy marked marked_old) (fact6 : EulerSieveSpec.previously_marked_multiples marked_old n) (fact7 : EulerSieveSpec.previously_marked_multiples marked n) (fact8 : EulerSieveSpec.only_multiples_marked marked_old n) (fact9 : EulerSieveSpec.prime_multiples_marked marked_old marked n (Int.ofNat (List.length marked))) : EulerSieveSpec.all_multiples_marked marked n (Int.ofNat (List.length marked))
  := sorry
end euler_sieve_EulerSieve_prev_and_new_impl_all_multiples_markedqtvc
