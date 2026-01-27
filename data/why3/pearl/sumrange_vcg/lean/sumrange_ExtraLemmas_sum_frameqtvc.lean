import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
open Classical
open Lean4Why3
namespace sumrange_ExtraLemmas_sum_frameqtvc
theorem sum_frame'vc (i : ℤ) (j : ℤ) (a1 : List ℤ) (a2 : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ j) (fact2 : j ≤ Int.ofNat (List.length a1)) (fact3 : j ≤ Int.ofNat (List.length a2)) (fact4 : ∀(k : ℤ), i ≤ k ∧ k < j → a1[Int.toNat k]! = a2[Int.toNat k]!) : ArraySum.sum a1 i j = ArraySum.sum a2 i j
  := sorry
end sumrange_ExtraLemmas_sum_frameqtvc
