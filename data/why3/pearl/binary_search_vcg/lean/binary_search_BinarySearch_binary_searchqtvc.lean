import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace binary_search_BinarySearch_binary_searchqtvc
theorem binary_search'vc (a : List ℤ) (v : ℤ) (fact0 : ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 ≤ i2 ∧ i2 < Int.ofNat (List.length a) → a[Int.toNat i1]! ≤ a[Int.toNat i2]!) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); (((0 : ℤ) ≤ (0 : ℤ) ∧ o1 < Int.ofNat (List.length a)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → a[Int.toNat i]! = v → (0 : ℤ) ≤ i ∧ i ≤ o1)) ∧ (∀(u : ℤ) (l : ℤ), ((0 : ℤ) ≤ l ∧ u < Int.ofNat (List.length a)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → a[Int.toNat i]! = v → l ≤ i ∧ i ≤ u) → (if l ≤ u then ¬(2 : ℤ) = (0 : ℤ) ∧ (let m : ℤ := l + Int.tdiv (u - l) (2 : ℤ); ((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ (if a[Int.toNat m]! < v then ((0 : ℤ) ≤ u - l ∧ u - (m + (1 : ℤ)) < u - l) ∧ ((0 : ℤ) ≤ m + (1 : ℤ) ∧ u < Int.ofNat (List.length a)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → a[Int.toNat i]! = v → m + (1 : ℤ) ≤ i ∧ i ≤ u) else ((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ (if v < a[Int.toNat m]! then ((0 : ℤ) ≤ u - l ∧ m - (1 : ℤ) - l < u - l) ∧ ((0 : ℤ) ≤ l ∧ m - (1 : ℤ) < Int.ofNat (List.length a)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → a[Int.toNat i]! = v → l ≤ i ∧ i ≤ m - (1 : ℤ)) else ((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ a[Int.toNat m]! = v))) else ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → ¬a[Int.toNat i]! = v))
  := sorry
end binary_search_BinarySearch_binary_searchqtvc
