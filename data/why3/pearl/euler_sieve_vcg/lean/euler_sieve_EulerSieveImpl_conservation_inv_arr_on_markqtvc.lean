import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
import Why3.mach.array.ArrayInt63
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieveImpl_conservation_inv_arr_on_markqtvc
theorem conservation_inv_arr_on_mark'vc (arr : List ℤ) (i : ℤ) (j : ℤ) (k : ℤ) (fact0 : ∀(j : ℤ) (k : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length arr) → j < k ∧ k < abs (arr[Int.toNat j]!) / (2 : ℤ) → arr[Int.toNat k]! < (0 : ℤ)) (fact1 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length arr) → i < abs (arr[Int.toNat i]!) / (2 : ℤ) ∧ abs (arr[Int.toNat i]!) / (2 : ℤ) ≤ Int.ofNat (List.length arr)) (fact2 : (0 : ℤ) ≤ i) (fact3 : i < Int.ofNat (List.length arr)) (fact4 : (0 : ℤ) ≤ arr[Int.toNat i]!) (fact5 : (0 : ℤ) ≤ j) (fact6 : j < Int.ofNat (List.length arr)) (fact7 : j < k) (fact8 : k < abs ((List.set arr (Int.toNat i) (-arr[Int.toNat i]!))[Int.toNat j]!) / (2 : ℤ)) : (List.set arr (Int.toNat i) (-arr[Int.toNat i]!))[Int.toNat k]! < (0 : ℤ)
  := sorry
end euler_sieve_EulerSieveImpl_conservation_inv_arr_on_markqtvc
