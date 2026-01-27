import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace lemma_functions_LemmaFunction2_sum_nonnegqtvc
theorem sum_nonneg'vc (l : ℤ) (u : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ u) (fact2 : u ≤ Int.ofNat (List.length a)) (fact3 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (0 : ℤ) ≤ a[Int.toNat i]!) : (0 : ℤ) ≤ List.sum (List.drop (Int.toNat l) (List.take (Int.toNat u - Int.toNat l) a))
  := sorry
end lemma_functions_LemmaFunction2_sum_nonnegqtvc
