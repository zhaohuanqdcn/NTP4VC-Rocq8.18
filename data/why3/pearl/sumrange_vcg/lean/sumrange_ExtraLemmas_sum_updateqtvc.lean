import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
open Classical
open Lean4Why3
namespace sumrange_ExtraLemmas_sum_updateqtvc
theorem sum_update'vc (l : ℤ) (i : ℤ) (h : ℤ) (a : List ℤ) (v : ℤ) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ i) (fact2 : i < h) (fact3 : h ≤ Int.ofNat (List.length a)) : ArraySum.sum (List.set a (Int.toNat i) v) l h = ArraySum.sum a l h + v - a[Int.toNat i]!
  := sorry
end sumrange_ExtraLemmas_sum_updateqtvc
