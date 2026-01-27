import Why3.Base
open Classical
open Lean4Why3
namespace infinity_of_primes_Top_prime_factorqtvc
theorem prime_factor'vc (n : ℤ) (fact0 : (2 : ℤ) ≤ n) : ((2 : ℤ) ≤ n + (1 : ℤ) → (∀(d : ℤ), (2 : ℤ) ≤ d ∧ d < (2 : ℤ) → ¬d ∣  n) ∧ (∀(p : ℤ), ((2 : ℤ) ≤ p ∧ p ≤ n) ∧ (∀(d : ℤ), (2 : ℤ) ≤ d ∧ d < p → ¬d ∣  n) → ¬p = (0 : ℤ) ∧ (if Int.tmod n p = (0 : ℤ) then Nat.Prime (Int.toNat p) ∧ p ∣  n else ∀(d : ℤ), (2 : ℤ) ≤ d ∧ d < p + (1 : ℤ) → ¬d ∣  n)) ∧ ((∀(d : ℤ), (2 : ℤ) ≤ d ∧ d < n + (1 : ℤ) → ¬d ∣  n) → Nat.Prime (Int.toNat n) ∧ n ∣  n)) ∧ (n + (1 : ℤ) < (2 : ℤ) → Nat.Prime (Int.toNat n) ∧ n ∣  n)
  := sorry
end infinity_of_primes_Top_prime_factorqtvc
