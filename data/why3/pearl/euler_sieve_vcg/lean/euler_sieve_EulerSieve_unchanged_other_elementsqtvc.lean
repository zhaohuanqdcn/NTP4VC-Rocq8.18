import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_unchanged_other_elementsqtvc
theorem unchanged_other_elements'vc {α : Type} [Inhabited α] (i : ℤ) (s2 : List α) (v : α) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Int.ofNat (List.length (List.set s2 (Int.toNat i) v))) (fact2 : List.length (List.set s2 (Int.toNat i) v) = List.length s2) (fact3 : (0 : ℤ) ≤ j) (fact4 : j < Int.ofNat (List.length (List.set s2 (Int.toNat i) v))) (fact5 : ¬i = j) : (List.set s2 (Int.toNat i) v)[Int.toNat j]! = s2[Int.toNat j]!
  := sorry
end euler_sieve_EulerSieve_unchanged_other_elementsqtvc
