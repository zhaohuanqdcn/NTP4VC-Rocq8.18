import Why3.Base
open Classical
open Lean4Why3
namespace rac_Arrays_test0qtvc
theorem test0'vc : (0 : ℤ) ≤ (10 : ℤ) ∧ (∀(a : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (10 : ℤ) → a[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length a) = (10 : ℤ) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length a)) ∧ (List.length (List.set a (0 : ℕ) (10 : ℤ)) = List.length a → getElem! (List.set a (0 : ℕ) (10 : ℤ)) ∘ Int.toNat = Function.update (getElem! a ∘ Int.toNat) (0 : ℤ) (10 : ℤ) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length (List.set a (0 : ℕ) (10 : ℤ)))) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length (List.set a (0 : ℕ) (10 : ℤ)))))
  := sorry
end rac_Arrays_test0qtvc
