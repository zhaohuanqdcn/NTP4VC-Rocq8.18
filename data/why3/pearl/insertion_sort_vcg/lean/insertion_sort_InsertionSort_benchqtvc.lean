import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace insertion_sort_InsertionSort_benchqtvc
theorem bench'vc (a : List ℤ) (fact0 : Int.ofNat (List.length a) = (8 : ℤ)) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length a) ∧ (a[(0 : ℕ)]! = -(5 : ℤ) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length a)) ∧ (a[(1 : ℕ)]! = (6 : ℤ) → ((0 : ℤ) ≤ (2 : ℤ) ∧ (2 : ℤ) < Int.ofNat (List.length a)) ∧ (a[(2 : ℕ)]! = (17 : ℤ) → ((0 : ℤ) ≤ (3 : ℤ) ∧ (3 : ℤ) < Int.ofNat (List.length a)) ∧ (a[(3 : ℕ)]! = (42 : ℤ) → ((0 : ℤ) ≤ (4 : ℤ) ∧ (4 : ℤ) < Int.ofNat (List.length a)) ∧ (a[(4 : ℕ)]! = (53 : ℤ) → ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < Int.ofNat (List.length a)) ∧ (a[(5 : ℕ)]! = (69 : ℤ) → ((0 : ℤ) ≤ (6 : ℤ) ∧ (6 : ℤ) < Int.ofNat (List.length a)) ∧ (a[(6 : ℕ)]! = (91 : ℤ) → (0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < Int.ofNat (List.length a))))))))
  := sorry
end insertion_sort_InsertionSort_benchqtvc
