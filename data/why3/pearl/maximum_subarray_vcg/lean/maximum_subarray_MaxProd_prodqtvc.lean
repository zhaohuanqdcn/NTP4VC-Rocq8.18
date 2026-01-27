import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace maximum_subarray_MaxProd_prodqtvc
theorem prod'vc (lo : ℤ) (hi : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ lo) (fact1 : lo ≤ hi) (fact2 : hi ≤ Int.ofNat (List.length a)) (fact3 : ¬lo = hi) : let o1 : ℤ := hi - (1 : ℤ); ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length a)) ∧ (let o2 : ℤ := hi - (1 : ℤ); ((0 : ℤ) ≤ hi - lo ∧ o2 - lo < hi - lo) ∧ (0 : ℤ) ≤ lo ∧ lo ≤ o2 ∧ o2 ≤ Int.ofNat (List.length a))
  := sorry
end maximum_subarray_MaxProd_prodqtvc
