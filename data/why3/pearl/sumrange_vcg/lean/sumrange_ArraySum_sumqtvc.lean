import Why3.Base
open Classical
open Lean4Why3
namespace sumrange_ArraySum_sumqtvc
theorem sum'vc (i : ℤ) (j : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ j) (fact2 : j ≤ Int.ofNat (List.length a)) (fact3 : ¬j ≤ i) : let o1 : ℤ := i + (1 : ℤ); (((0 : ℤ) ≤ j - i ∧ j - o1 < j - i) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ j ∧ j ≤ Int.ofNat (List.length a)) ∧ (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)
  := sorry
end sumrange_ArraySum_sumqtvc
