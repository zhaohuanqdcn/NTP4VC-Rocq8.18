import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace infinity_of_primes_Top_infinity_of_primesqtvc
theorem infinity_of_primes'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → ((1 : ℤ) ≤ (1 : ℤ) ∧ Int.ofNat (Finset.card (∅ : Finset ℤ)) = (0 : ℤ) ∧ (∀(k : ℤ), k ∈ (∅ : Finset ℤ) → Nat.Prime (Int.toNat k)) ∧ (∀(k : ℤ), k ∈ (∅ : Finset ℤ) → k ∣  (1 : ℤ))) ∧ (∀(x : ℤ) (s : Finset ℤ), (((0 : ℤ) ≤ Int.ofNat (Finset.card s) ∧ Int.ofNat (Finset.card s) ≤ o1) ∧ (1 : ℤ) ≤ x ∧ (∀(k : ℤ), k ∈ s → Nat.Prime (Int.toNat k)) ∧ (∀(k : ℤ), k ∈ s → k ∣  x) → (1 : ℤ) ≤ x * (x + (1 : ℤ)) ∧ Int.ofNat (Finset.card (insert (x + (1 : ℤ)) s)) = Int.ofNat (Finset.card s) + (1 : ℤ) ∧ (∀(k : ℤ), k ∈ insert (x + (1 : ℤ)) s → Nat.Prime (Int.toNat k)) ∧ (∀(k : ℤ), k ∈ insert (x + (1 : ℤ)) s → k ∣  x * (x + (1 : ℤ)))) ∧ ((1 : ℤ) ≤ x ∧ Int.ofNat (Finset.card s) = o1 + (1 : ℤ) ∧ (∀(k : ℤ), k ∈ s → Nat.Prime (Int.toNat k)) ∧ (∀(k : ℤ), k ∈ s → k ∣  x) → Int.ofNat (Finset.card s) = n ∧ (∀(k : ℤ), k ∈ s → Nat.Prime (Int.toNat k))))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → (let s : Finset ℤ := (∅ : Finset ℤ); Int.ofNat (Finset.card s) = n ∧ (∀(k : ℤ), k ∈ s → Nat.Prime (Int.toNat k))))
  := sorry
end infinity_of_primes_Top_infinity_of_primesqtvc
