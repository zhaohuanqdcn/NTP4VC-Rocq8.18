import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import pearl.quicksort_vcg.lean.quicksort.Quicksort
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace quicksort_Test_test1qtvc
theorem test1'vc : (0 : ℤ) ≤ (3 : ℤ) ∧ (∀(a : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (3 : ℤ) → a[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length a) = (3 : ℤ) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length a)) ∧ (List.length (List.set a (0 : ℕ) (7 : ℤ)) = List.length a → getElem! (List.set a (0 : ℕ) (7 : ℤ)) ∘ Int.toNat = Function.update (getElem! a ∘ Int.toNat) (0 : ℤ) (7 : ℤ) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length (List.set a (0 : ℕ) (7 : ℤ)))) ∧ (List.length (List.set (List.set a (0 : ℕ) (7 : ℤ)) (1 : ℕ) (3 : ℤ)) = List.length (List.set a (0 : ℕ) (7 : ℤ)) → getElem! (List.set (List.set a (0 : ℕ) (7 : ℤ)) (1 : ℕ) (3 : ℤ)) ∘ Int.toNat = Function.update (getElem! (List.set a (0 : ℕ) (7 : ℤ)) ∘ Int.toNat) (1 : ℤ) (3 : ℤ) → (0 : ℤ) ≤ (2 : ℤ) ∧ (2 : ℤ) < Int.ofNat (List.length (List.set (List.set a (0 : ℕ) (7 : ℤ)) (1 : ℕ) (3 : ℤ))))))
  := sorry
end quicksort_Test_test1qtvc
