import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace verifythis_2017_odd_even_sort_rearranging_Top_array_maxqtvc
theorem array_max'vc (a : List ℤ) : if Int.ofNat (List.length a) = (0 : ℤ) then ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) → a[Int.toNat j]! ≤ (0 : ℤ) else ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length a)) ∧ (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → a[Int.toNat j]! ≤ a[(0 : ℕ)]!)) ∧ (∀(i : ℤ) (m : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → a[Int.toNat j]! ≤ m) → (if i < Int.ofNat (List.length a) then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (if m < a[Int.toNat i]! then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ ((0 : ℤ) ≤ Int.ofNat (List.length a) - i ∧ Int.ofNat (List.length a) - (i + (1 : ℤ)) < Int.ofNat (List.length a) - i) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → a[Int.toNat j]! ≤ a[Int.toNat i]!) else ((0 : ℤ) ≤ Int.ofNat (List.length a) - i ∧ Int.ofNat (List.length a) - (i + (1 : ℤ)) < Int.ofNat (List.length a) - i) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → a[Int.toNat j]! ≤ m)) else ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) → a[Int.toNat j]! ≤ m))
  := sorry
end verifythis_2017_odd_even_sort_rearranging_Top_array_maxqtvc
