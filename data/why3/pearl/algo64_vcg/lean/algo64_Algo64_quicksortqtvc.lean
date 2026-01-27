import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace algo64_Algo64_quicksortqtvc
noncomputable def qs_partition (t1 : List ℤ) (t2 : List ℤ) (m : ℤ) (n : ℤ) (i : ℤ) (j : ℤ) (x : ℤ) := List.permut_sub' t1 t2 (Int.toNat m) (Int.toNat (n + (1 : ℤ))) ∧ (∀(k : ℤ), m ≤ k ∧ k ≤ j → t2[Int.toNat k]! ≤ x) ∧ (∀(k : ℤ), j < k ∧ k < i → t2[Int.toNat k]! = x) ∧ (∀(k : ℤ), i ≤ k ∧ k ≤ n → x ≤ t2[Int.toNat k]!)
theorem quicksort'vc (m : ℤ) (n : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ m) (fact1 : m ≤ n) (fact2 : n < Int.ofNat (List.length a)) : if m < n then ((0 : ℤ) ≤ m ∧ m < n ∧ n < Int.ofNat (List.length a)) ∧ (∀(j : ℤ) (i : ℤ) (a1 : List ℤ), List.length a1 = List.length a → (m ≤ j ∧ j < i ∧ i ≤ n) ∧ List.permut_sub' a a1 (Int.toNat m) (Int.toNat (n + (1 : ℤ))) ∧ (∀(r : ℤ), m ≤ r ∧ r ≤ j → a1[Int.toNat r]! ≤ (42 : ℤ)) ∧ (∀(r : ℤ), j < r ∧ r < i → a1[Int.toNat r]! = (42 : ℤ)) ∧ (∀(r : ℤ), i ≤ r ∧ r ≤ n → (42 : ℤ) ≤ a1[Int.toNat r]!) → (((0 : ℤ) ≤ n - m ∧ j - m < n - m) ∧ (0 : ℤ) ≤ m ∧ m ≤ j ∧ j < Int.ofNat (List.length a1)) ∧ (∀(a2 : List ℤ), List.length a2 = List.length a1 → List.permut_sub' a1 a2 (Int.toNat m) (Int.toNat (j + (1 : ℤ))) ∧ IntArraySorted.sorted_sub1 a2 m (j + (1 : ℤ)) → (((0 : ℤ) ≤ n - m ∧ n - i < n - m) ∧ (0 : ℤ) ≤ i ∧ i ≤ n ∧ n < Int.ofNat (List.length a2)) ∧ (∀(a3 : List ℤ), List.length a3 = List.length a2 → List.permut_sub' a2 a3 (Int.toNat i) (Int.toNat (n + (1 : ℤ))) ∧ IntArraySorted.sorted_sub1 a3 i (n + (1 : ℤ)) → List.permut_sub' a a3 (Int.toNat m) (Int.toNat (n + (1 : ℤ))) ∧ IntArraySorted.sorted_sub1 a3 m (n + (1 : ℤ))))) else List.permut_sub' a a (Int.toNat m) (Int.toNat (n + (1 : ℤ))) ∧ IntArraySorted.sorted_sub1 a m (n + (1 : ℤ))
  := sorry
end algo64_Algo64_quicksortqtvc
