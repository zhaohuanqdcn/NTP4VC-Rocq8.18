import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
import pearl.euler_sieve_vcg.lean.euler_sieve.EulerSieveSpec
import Why3.mach.array.ArrayInt63
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieveImpl_get_markqtrefnqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom nexts : t -> List ℤ
axiom marked : t -> List Bool
axiom arr : t -> ArrayInt63.array63
axiom max : t -> BitVec 63
axiom max_arr : t -> BitVec 63
axiom t'invariant (self : t) : BitVec.toInt (max self) < BitVec.toInt int'63_max ∧ (3 : ℤ) ≤ BitVec.toInt (max self) ∧ List.length (nexts self) = List.length (marked self) ∧ Int.ofNat (List.length (marked self)) = BitVec.toInt (max self) + (1 : ℤ) ∧ (BitVec.toInt (max self) - (1 : ℤ)) / (2 : ℤ) = BitVec.toInt (max_arr self) ∧ Int.ofNat (List.length (ArrayInt63.elts (arr self))) = BitVec.toInt (max_arr self) + (1 : ℤ) ∧ EulerSieveSpec.inv_nexts (nexts self) (Int.ofNat (List.length (nexts self))) ∧ EulerSieveSpec.all_eliminated_marked (marked self) (nexts self) ∧ (∀(i : ℤ), (3 : ℤ) ≤ i ∧ i ≤ BitVec.toInt (max self) → i % (2 : ℤ) = (0 : ℤ) → (marked self)[Int.toNat i]! = true) ∧ (∀(i : ℤ), (3 : ℤ) ≤ i ∧ i < BitVec.toInt (max self) - (1 : ℤ) → i % (2 : ℤ) = (1 : ℤ) → (nexts self)[Int.toNat i]! % (2 : ℤ) = (1 : ℤ) ∨ (nexts self)[Int.toNat i]! = BitVec.toInt (max self) + (1 : ℤ)) ∧ (nexts self)[Int.toNat (BitVec.toInt (max self))]! = BitVec.toInt (max self) + (1 : ℤ) ∧ ((BitVec.toInt (max self) - (1 : ℤ)) % (2 : ℤ) = (0 : ℤ) → (nexts self)[Int.toNat (BitVec.toInt (max self) - (1 : ℤ))]! = BitVec.toInt (max self)) ∧ ((BitVec.toInt (max self) - (1 : ℤ)) % (2 : ℤ) = (1 : ℤ) → (nexts self)[Int.toNat (BitVec.toInt (max self) - (1 : ℤ))]! = BitVec.toInt (max self) + (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt (max_arr self) → -(BitVec.toInt (max self) + (1 : ℤ)) ≤ (ArrayInt63.elts (arr self))[Int.toNat i]! ∧ (ArrayInt63.elts (arr self))[Int.toNat i]! ≤ BitVec.toInt (max self) + (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt (max_arr self) → ((marked self)[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]! = true) = ((ArrayInt63.elts (arr self))[Int.toNat i]! < (0 : ℤ))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt (max_arr self) → ¬(marked self)[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]! = true → (ArrayInt63.elts (arr self))[Int.toNat i]! = (nexts self)[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt (max_arr self) → (marked self)[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]! = true → (ArrayInt63.elts (arr self))[Int.toNat i]! = -(nexts self)[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt (max_arr self) → (i < abs ((ArrayInt63.elts (arr self))[Int.toNat i]!) / (2 : ℤ) ∧ abs ((ArrayInt63.elts (arr self))[Int.toNat i]!) / (2 : ℤ) ≤ BitVec.toInt (max_arr self) + (1 : ℤ)) ∧ abs ((ArrayInt63.elts (arr self))[Int.toNat i]!) ≤ BitVec.toInt (max self) + (1 : ℤ)) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt (max_arr self) → i < j ∧ j < abs ((ArrayInt63.elts (arr self))[Int.toNat i]!) / (2 : ℤ) → (ArrayInt63.elts (arr self))[Int.toNat j]! < (0 : ℤ))
noncomputable def t'eq (a : t) (b : t) := nexts a = nexts b ∧ marked a = marked b ∧ arr a = arr b ∧ max a = max b ∧ max_arr a = max_arr b
axiom t'inj (a : t) (b : t) (fact0 : t'eq a b) : a = b
theorem get_mark'refn'vc (i : BitVec 63) (t1 : t) (fact0 : (0 : ℤ) ≤ BitVec.toInt i) (fact1 : BitVec.toInt i ≤ BitVec.toInt (max t1)) (fact2 : BitVec.toInt i % (2 : ℤ) = (1 : ℤ)) : (0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i ≤ BitVec.toInt (max t1) ∧ BitVec.toInt i % (2 : ℤ) = (1 : ℤ)
  := sorry
end euler_sieve_EulerSieveImpl_get_markqtrefnqtvc
