import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeArray_queryqtvc
noncomputable def is_cumulative_array_for (c : List ℤ) (a : List ℤ) := Int.ofNat (List.length c) = Int.ofNat (List.length a) + (1 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length c) → getElem! c (Int.toNat i) = ArraySum.sum a (0 : ℤ) i)
theorem query'vc (c : List ℤ) (a : List ℤ) (i : ℤ) (j : ℤ) (fact0 : is_cumulative_array_for c a) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ j) (fact3 : j < Int.ofNat (List.length c)) : (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length c) ∧ (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length c) ∧ getElem! c (Int.toNat j) - getElem! c (Int.toNat i) = ArraySum.sum a i j
  := sorry
end sumrange_CumulativeArray_queryqtvc
