import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieve_only_multiples_marked_impl_not_markedqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom nexts : t -> List ℤ
axiom marked : t -> List Bool
axiom max : t -> BitVec 63
axiom t'invariant (self : t) : BitVec.toInt (max self) < BitVec.toInt int'63_max ∧ (3 : ℤ) ≤ BitVec.toInt (max self) ∧ List.length (nexts self) = List.length (marked self) ∧ Int.ofNat (List.length (marked self)) = BitVec.toInt (max self) + (1 : ℤ) ∧ EulerSieveSpec.inv_nexts (nexts self) (Int.ofNat (List.length (nexts self))) ∧ EulerSieveSpec.all_eliminated_marked (marked self) (nexts self) ∧ (∀(i : ℤ), (3 : ℤ) ≤ i ∧ i ≤ BitVec.toInt (max self) → i % (2 : ℤ) = (0 : ℤ) → (marked self)[Int.toNat i]! = true) ∧ (∀(i : ℤ), (3 : ℤ) ≤ i ∧ i < BitVec.toInt (max self) - (1 : ℤ) → i % (2 : ℤ) = (1 : ℤ) → (nexts self)[Int.toNat i]! % (2 : ℤ) = (1 : ℤ) ∨ (nexts self)[Int.toNat i]! = BitVec.toInt (max self) + (1 : ℤ)) ∧ (nexts self)[Int.toNat (BitVec.toInt (max self))]! = BitVec.toInt (max self) + (1 : ℤ) ∧ ((BitVec.toInt (max self) - (1 : ℤ)) % (2 : ℤ) = (0 : ℤ) → (nexts self)[Int.toNat (BitVec.toInt (max self) - (1 : ℤ))]! = BitVec.toInt (max self)) ∧ ((BitVec.toInt (max self) - (1 : ℤ)) % (2 : ℤ) = (1 : ℤ) → (nexts self)[Int.toNat (BitVec.toInt (max self) - (1 : ℤ))]! = BitVec.toInt (max self) + (1 : ℤ))
theorem only_multiples_marked_impl_not_marked'vc (n : ℤ) (marked1 : List Bool) (nexts1 : List ℤ) (fact0 : (2 : ℤ) ≤ n) (fact1 : n < Int.ofNat (List.length marked1)) (fact2 : EulerSieveSpec.only_multiples_marked marked1 (nexts1[Int.toNat n]!)) (fact3 : Nat.Prime (Int.toNat n)) : ¬marked1[Int.toNat n]! = true
  := sorry
end euler_sieve_EulerSieve_only_multiples_marked_impl_not_markedqtvc
