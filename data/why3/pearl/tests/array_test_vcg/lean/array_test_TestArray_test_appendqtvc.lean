import Why3.Base
open Classical
open Lean4Why3
namespace array_test_TestArray_test_appendqtvc
theorem test_append'vc : (0 : ℤ) ≤ (17 : ℤ) ∧ (∀(a1 : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (17 : ℤ) → a1[Int.toNat i]! = (2 : ℤ)) ∧ Int.ofNat (List.length a1) = (17 : ℤ) → ((0 : ℤ) ≤ (3 : ℤ) ∧ (3 : ℤ) < Int.ofNat (List.length a1)) ∧ (List.length (List.set a1 (3 : ℕ) (4 : ℤ)) = List.length a1 → getElem! (List.set a1 (3 : ℕ) (4 : ℤ)) ∘ Int.toNat = Function.update (getElem! a1 ∘ Int.toNat) (3 : ℤ) (4 : ℤ) → (0 : ℤ) ≤ (25 : ℤ)))
  := sorry
end array_test_TestArray_test_appendqtvc
