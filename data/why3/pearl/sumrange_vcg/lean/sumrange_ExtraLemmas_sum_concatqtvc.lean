import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
open Classical
open Lean4Why3
namespace sumrange_ExtraLemmas_sum_concatqtvc
theorem sum_concat'vc (i : ℤ) (j : ℤ) (k : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ j) (fact2 : j ≤ k) (fact3 : k ≤ Int.ofNat (List.length a)) : ArraySum.sum a i k = ArraySum.sum a i j + ArraySum.sum a j k
  := sorry
end sumrange_ExtraLemmas_sum_concatqtvc
