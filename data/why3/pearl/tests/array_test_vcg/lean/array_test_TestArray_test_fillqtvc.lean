import Why3.Base
open Classical
open Lean4Why3
namespace array_test_TestArray_test_fillqtvc
theorem test_fill'vc : (0 : ℤ) ≤ (17 : ℤ) ∧ (∀(a : List Bool), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (17 : ℤ) → a[Int.toNat i]! = true) ∧ Int.ofNat (List.length a) = (17 : ℤ) → (0 : ℤ) ≤ (10 : ℤ) ∧ (0 : ℤ) ≤ (4 : ℤ) ∧ (10 : ℤ) + (4 : ℤ) ≤ Int.ofNat (List.length a))
  := sorry
end array_test_TestArray_test_fillqtvc
