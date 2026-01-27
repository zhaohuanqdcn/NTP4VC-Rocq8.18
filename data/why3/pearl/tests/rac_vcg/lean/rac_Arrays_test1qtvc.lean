import Why3.Base
open Classical
open Lean4Why3
namespace rac_Arrays_test1qtvc
theorem test1'vc : (0 : ℤ) ≤ (10 : ℤ) ∧ (∀(a : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (10 : ℤ) → a[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length a) = (10 : ℤ) → (0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length a))
  := sorry
end rac_Arrays_test1qtvc
