import Why3.Base
open Classical
open Lean4Why3
namespace array_test_TestArray_test_blitqtvc
theorem test_blit'vc : (0 : ℤ) ≤ (17 : ℤ) ∧ (∀(a1 : List Bool), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (17 : ℤ) → a1[Int.toNat i]! = true) ∧ Int.ofNat (List.length a1) = (17 : ℤ) → (0 : ℤ) ≤ (25 : ℤ) ∧ (∀(a2 : List Bool), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (25 : ℤ) → a2[Int.toNat i]! = false) ∧ Int.ofNat (List.length a2) = (25 : ℤ) → ((0 : ℤ) ≤ (10 : ℤ) ∧ (0 : ℤ) ≤ (7 : ℤ) ∧ (10 : ℤ) + (7 : ℤ) ≤ Int.ofNat (List.length a1)) ∧ (0 : ℤ) ≤ (17 : ℤ) ∧ (17 : ℤ) + (7 : ℤ) ≤ Int.ofNat (List.length a2)))
  := sorry
end array_test_TestArray_test_blitqtvc
