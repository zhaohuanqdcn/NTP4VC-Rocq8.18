import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.counting_sort_vcg.lean.counting_sort.Spec
import Why3.array.IntArraySorted
import pearl.counting_sort_vcg.lean.counting_sort.InPlaceCountingSort
open Classical
open Lean4Why3
namespace counting_sort_Harness_harnessqtvc
theorem harness'vc (fact0 : Spec.k = (2 : ℤ)) : (0 : ℤ) ≤ (3 : ℤ) ∧ (∀(a : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (3 : ℤ) → a[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length a) = (3 : ℤ) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length a)) ∧ (List.length (List.set a (1 : ℕ) (1 : ℤ)) = List.length a → getElem! (List.set a (1 : ℕ) (1 : ℤ)) ∘ Int.toNat = Function.update (getElem! a ∘ Int.toNat) (1 : ℤ) (1 : ℤ) → Spec.k_values (List.set a (1 : ℕ) (1 : ℤ))))
  := sorry
end counting_sort_Harness_harnessqtvc
