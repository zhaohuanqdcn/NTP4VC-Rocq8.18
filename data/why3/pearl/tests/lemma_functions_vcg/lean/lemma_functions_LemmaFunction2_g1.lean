import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace lemma_functions_LemmaFunction2_g1
theorem g1 (a : List ℤ) (fact0 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (0 : ℤ) ≤ a[Int.toNat i]!) : (0 : ℤ) ≤ List.sum (List.drop (0 : ℕ) (List.take (List.length a - (0 : ℕ)) a))
  := sorry
end lemma_functions_LemmaFunction2_g1
