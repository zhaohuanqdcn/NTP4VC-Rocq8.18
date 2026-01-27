import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
import Why3.mach.array.ArrayInt63
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieveImpl_conservation_inv_arr_on_jumpqtvc
theorem conservation_inv_arr_on_jump'vc (min : ℤ) (arr : List ℤ) (i : ℤ) (j : ℤ) (k : ℤ) (fact0 : (0 : ℤ) ≤ min) (fact1 : ∀(j : ℤ) (k : ℤ), min ≤ j ∧ j < Int.ofNat (List.length arr) → j < k ∧ k < abs (arr[Int.toNat j]!) / (2 : ℤ) → arr[Int.toNat k]! < (0 : ℤ)) (fact2 : ∀(i : ℤ), min ≤ i ∧ i < Int.ofNat (List.length arr) → i < abs (arr[Int.toNat i]!) / (2 : ℤ) ∧ abs (arr[Int.toNat i]!) / (2 : ℤ) ≤ Int.ofNat (List.length arr)) (fact3 : min ≤ i) (fact4 : i < Int.ofNat (List.length arr)) (fact5 : (0 : ℤ) ≤ arr[Int.toNat i]! / (2 : ℤ)) (fact6 : arr[Int.toNat i]! / (2 : ℤ) < Int.ofNat (List.length arr)) (fact7 : arr[Int.toNat (arr[Int.toNat i]! / (2 : ℤ))]! < (0 : ℤ)) (fact8 : min ≤ j) (fact9 : j < Int.ofNat (List.length arr)) (fact10 : j < k) (fact11 : k < abs ((List.set arr (Int.toNat i) (-arr[Int.toNat (arr[Int.toNat i]! / (2 : ℤ))]!))[Int.toNat j]!) / (2 : ℤ)) : (List.set arr (Int.toNat i) (-arr[Int.toNat (arr[Int.toNat i]! / (2 : ℤ))]!))[Int.toNat k]! < (0 : ℤ)
  := sorry
end euler_sieve_EulerSieveImpl_conservation_inv_arr_on_jumpqtvc
