import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace knuth_prime_numbers_PrimeNumbers_benchqtvc
noncomputable def no_prime_in (l : ℤ) (u : ℤ) := ∀(x : ℤ), l < x ∧ x < u → ¬Nat.Prime (Int.toNat x)
noncomputable def first_primes (p : ℤ -> ℤ) (u : ℤ) := p (0 : ℤ) = (2 : ℤ) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < u → p i < p j) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < u → Nat.Prime (Int.toNat (p i))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < u - (1 : ℤ) → no_prime_in (p i) (p (i + (1 : ℤ))))
axiom Bertrand_postulate (p : ℤ) (fact0 : Nat.Prime (Int.toNat p)) : ¬no_prime_in p ((2 : ℤ) * p)
theorem bench'vc : (2 : ℤ) ≤ (100 : ℤ) ∧ (∀(t : List ℤ), Int.ofNat (List.length t) = (100 : ℤ) ∧ first_primes (getElem! t ∘ Int.toNat) (100 : ℤ) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(0 : ℕ)]! = (2 : ℤ) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(1 : ℕ)]! = (3 : ℤ) → ((0 : ℤ) ≤ (2 : ℤ) ∧ (2 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(2 : ℕ)]! = (5 : ℤ) → ((0 : ℤ) ≤ (3 : ℤ) ∧ (3 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(3 : ℕ)]! = (7 : ℤ) → ((0 : ℤ) ≤ (4 : ℤ) ∧ (4 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(4 : ℕ)]! = (11 : ℤ) → ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(5 : ℕ)]! = (13 : ℤ) → ((0 : ℤ) ≤ (6 : ℤ) ∧ (6 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(6 : ℕ)]! = (17 : ℤ) → ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(7 : ℕ)]! = (19 : ℤ) → ((0 : ℤ) ≤ (8 : ℤ) ∧ (8 : ℤ) < Int.ofNat (List.length t)) ∧ (t[(8 : ℕ)]! = (23 : ℤ) → (0 : ℤ) ≤ (9 : ℤ) ∧ (9 : ℤ) < Int.ofNat (List.length t)))))))))))
  := sorry
end knuth_prime_numbers_PrimeNumbers_benchqtvc
