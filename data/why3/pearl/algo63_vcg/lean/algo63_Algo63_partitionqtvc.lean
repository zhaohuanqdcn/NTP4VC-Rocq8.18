import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace algo63_Algo63_partitionqtvc
theorem partition'vc (m : ℤ) (n : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ m) (fact1 : m < n) (fact2 : n < Int.ofNat (List.length a)) : (0 : ℤ) ≤ m ∧ m < n ∧ n < Int.ofNat (List.length a) ∧ (∀(o1 : ℤ) (j : ℤ) (i : ℤ) (a1 : List ℤ), List.length a1 = List.length a → (m ≤ j ∧ j < i ∧ i ≤ n) ∧ List.permut_sub' a a1 (Int.toNat m) (Int.toNat (n + (1 : ℤ))) ∧ (∀(r : ℤ), m ≤ r ∧ r ≤ j → a1[Int.toNat r]! ≤ o1) ∧ (∀(r : ℤ), j < r ∧ r < i → a1[Int.toNat r]! = o1) ∧ (∀(r : ℤ), i ≤ r ∧ r ≤ n → o1 ≤ a1[Int.toNat r]!) → (m ≤ j ∧ j < i ∧ i ≤ n) ∧ List.permut_sub' a a1 (Int.toNat m) (Int.toNat (n + (1 : ℤ))) ∧ (∃(x : ℤ), (∀(r : ℤ), m ≤ r ∧ r ≤ j → a1[Int.toNat r]! ≤ x) ∧ (∀(r : ℤ), j < r ∧ r < i → a1[Int.toNat r]! = x) ∧ (∀(r : ℤ), i ≤ r ∧ r ≤ n → x ≤ a1[Int.toNat r]!)))
  := sorry
end algo63_Algo63_partitionqtvc
