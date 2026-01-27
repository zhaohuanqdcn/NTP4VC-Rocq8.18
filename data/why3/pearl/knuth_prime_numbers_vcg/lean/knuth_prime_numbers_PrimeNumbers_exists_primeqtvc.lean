import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace knuth_prime_numbers_PrimeNumbers_exists_primeqtvc
noncomputable def no_prime_in (l : ℤ) (u : ℤ) := ∀(x : ℤ), l < x ∧ x < u → ¬Nat.Prime (Int.toNat x)
noncomputable def first_primes (p : ℤ -> ℤ) (u : ℤ) := p (0 : ℤ) = (2 : ℤ) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < u → p i < p j) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < u → Nat.Prime (Int.toNat (p i))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < u - (1 : ℤ) → no_prime_in (p i) (p (i + (1 : ℤ))))
theorem exists_prime'vc (u : ℤ) (p : ℤ -> ℤ) (d : ℤ) (fact0 : (1 : ℤ) ≤ u) (fact1 : first_primes p u) (fact2 : (2 : ℤ) ≤ d) (fact3 : d ≤ p (u - (1 : ℤ))) (fact4 : Nat.Prime (Int.toNat d)) : ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < u) ∧ d = p i
  := sorry
end knuth_prime_numbers_PrimeNumbers_exists_primeqtvc
