import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.inverse_in_place_vcg.lean.inverse_in_place.InverseInPlace
open Classical
open Lean4Why3
namespace inverse_in_place_Harness_test1qtvc
theorem test1'vc : (0 : ℤ) ≤ (3 : ℤ) ∧ (∀(a : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (3 : ℤ) → a[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length a) = (3 : ℤ) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length a)) ∧ (List.length (List.set a (0 : ℕ) (2 : ℤ)) = List.length a → getElem! (List.set a (0 : ℕ) (2 : ℤ)) ∘ Int.toNat = Function.update (getElem! a ∘ Int.toNat) (0 : ℤ) (2 : ℤ) → ((0 : ℤ) ≤ (2 : ℤ) ∧ (2 : ℤ) < Int.ofNat (List.length (List.set a (0 : ℕ) (2 : ℤ)))) ∧ (List.length (List.set (List.set a (0 : ℕ) (2 : ℤ)) (2 : ℕ) (0 : ℤ)) = List.length (List.set a (0 : ℕ) (2 : ℤ)) → getElem! (List.set (List.set a (0 : ℕ) (2 : ℤ)) (2 : ℕ) (0 : ℤ)) ∘ Int.toNat = Function.update (getElem! (List.set a (0 : ℕ) (2 : ℤ)) ∘ Int.toNat) (2 : ℤ) (0 : ℤ) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length (List.set (List.set a (0 : ℕ) (2 : ℤ)) (2 : ℕ) (0 : ℤ)))) ∧ (List.length (List.set (List.set (List.set a (0 : ℕ) (2 : ℤ)) (2 : ℕ) (0 : ℤ)) (1 : ℕ) (1 : ℤ)) = List.length (List.set (List.set a (0 : ℕ) (2 : ℤ)) (2 : ℕ) (0 : ℤ)) → getElem! (List.set (List.set (List.set a (0 : ℕ) (2 : ℤ)) (2 : ℕ) (0 : ℤ)) (1 : ℕ) (1 : ℤ)) ∘ Int.toNat = Function.update (getElem! (List.set (List.set a (0 : ℕ) (2 : ℤ)) (2 : ℕ) (0 : ℤ)) ∘ Int.toNat) (1 : ℤ) (1 : ℤ) → InverseInPlace.is_permutation (List.set (List.set (List.set a (0 : ℕ) (2 : ℤ)) (2 : ℕ) (0 : ℤ)) (1 : ℕ) (1 : ℤ))))))
  := sorry
end inverse_in_place_Harness_test1qtvc
