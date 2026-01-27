import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_tqtvc
axiom o1 : ℤ -> Bool
axiom o2 : ℤ -> ℤ
axiom o'def (i : ℤ) : (o1 i = true) = (i < (2 : ℤ))
axiom o'def1 (i : ℤ) : o2 i = i + (1 : ℤ)
theorem t'vc : let o3 : ℤ -> Bool := o1; (0 : ℤ) ≤ (4 : ℤ) ∧ (let o4 : List Bool := List.create (4 : ℕ) (o3 ∘ Int.ofNat); Int.ofNat (List.length o4) = (4 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → o4[Int.toNat i]! = o3 i) → (let o5 : ℤ -> ℤ := o2; (0 : ℤ) ≤ (4 : ℤ) ∧ (let o6 : List ℤ := List.create (4 : ℕ) (o5 ∘ Int.ofNat); Int.ofNat (List.length o6) = (4 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → o6[Int.toNat i]! = o5 i) → ((3 : ℤ) < BitVec.toInt int'63_max ∧ (3 : ℤ) ≤ (3 : ℤ)) ∧ ((3 : ℤ) < BitVec.toInt int'63_max ∧ (3 : ℤ) ≤ (3 : ℤ) → (List.length o6 = List.length o4 ∧ Int.ofNat (List.length o4) = (3 : ℤ) + (1 : ℤ)) ∧ (List.length o6 = List.length o4 ∧ Int.ofNat (List.length o4) = (3 : ℤ) + (1 : ℤ) → EulerSieveSpec.inv_nexts o6 (Int.ofNat (List.length o6)) ∧ (EulerSieveSpec.inv_nexts o6 (Int.ofNat (List.length o6)) → EulerSieveSpec.all_eliminated_marked o4 o6 ∧ (EulerSieveSpec.all_eliminated_marked o4 o6 → (∀(i : ℤ), (3 : ℤ) ≤ i ∧ i ≤ (3 : ℤ) → i % (2 : ℤ) = (0 : ℤ) → o4[Int.toNat i]! = true) ∧ ((∀(i : ℤ), (3 : ℤ) ≤ i ∧ i ≤ (3 : ℤ) → i % (2 : ℤ) = (0 : ℤ) → o4[Int.toNat i]! = true) → (∀(i : ℤ), (3 : ℤ) ≤ i ∧ i < (3 : ℤ) - (1 : ℤ) → i % (2 : ℤ) = (1 : ℤ) → o6[Int.toNat i]! % (2 : ℤ) = (1 : ℤ) ∨ o6[Int.toNat i]! = (3 : ℤ) + (1 : ℤ)) ∧ ((∀(i : ℤ), (3 : ℤ) ≤ i ∧ i < (3 : ℤ) - (1 : ℤ) → i % (2 : ℤ) = (1 : ℤ) → o6[Int.toNat i]! % (2 : ℤ) = (1 : ℤ) ∨ o6[Int.toNat i]! = (3 : ℤ) + (1 : ℤ)) → o6[(3 : ℕ)]! = (3 : ℤ) + (1 : ℤ) ∧ (((3 : ℤ) - (1 : ℤ)) % (2 : ℤ) = (0 : ℤ) → o6[Int.toNat ((3 : ℤ) - (1 : ℤ))]! = (3 : ℤ)) ∧ (((3 : ℤ) - (1 : ℤ)) % (2 : ℤ) = (1 : ℤ) → o6[Int.toNat ((3 : ℤ) - (1 : ℤ))]! = (3 : ℤ) + (1 : ℤ)))))))))))
  := sorry
end euler_sieve_EulerSieve_tqtvc
