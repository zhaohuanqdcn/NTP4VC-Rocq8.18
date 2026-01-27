import Why3.Base
open Classical
open Lean4Why3
namespace zeros_SetZeros_set_zerosqtvc
theorem set_zeros'vc (a : List ℤ) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → a[Int.toNat j]! = (0 : ℤ)) ∧ (∀(a1 : List ℤ), List.length a1 = List.length a → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → a1[Int.toNat j]! = (0 : ℤ)) → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (List.length (List.set a1 (Int.toNat i) (0 : ℤ)) = List.length a1 → getElem! (List.set a1 (Int.toNat i) (0 : ℤ)) ∘ Int.toNat = Function.update (getElem! a1 ∘ Int.toNat) i (0 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → (List.set a1 (Int.toNat i) (0 : ℤ))[Int.toNat j]! = (0 : ℤ)))) ∧ ((∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < o1 + (1 : ℤ) → a1[Int.toNat j]! = (0 : ℤ)) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a1) → a1[Int.toNat j]! = (0 : ℤ))))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) → a[Int.toNat j]! = (0 : ℤ)))
  := sorry
end zeros_SetZeros_set_zerosqtvc
