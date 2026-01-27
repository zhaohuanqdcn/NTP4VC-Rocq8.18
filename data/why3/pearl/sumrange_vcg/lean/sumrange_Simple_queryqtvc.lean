import Why3.Base
import Why3.why3.Ref.Ref
import pearl.sumrange_vcg.lean.sumrange.ArraySum
open Classical
open Lean4Why3
namespace sumrange_Simple_queryqtvc
theorem query'vc (i : ℤ) (j : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ j) (fact2 : j ≤ Int.ofNat (List.length a)) : let o1 : ℤ := j - (1 : ℤ); (i ≤ o1 + (1 : ℤ) → (0 : ℤ) = ArraySum.sum a i i ∧ (∀(s : ℤ), (∀(k : ℤ), (i ≤ k ∧ k ≤ o1) ∧ s = ArraySum.sum a i k → ((0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a)) ∧ s + a[Int.toNat k]! = ArraySum.sum a i (k + (1 : ℤ))) ∧ (s = ArraySum.sum a i (o1 + (1 : ℤ)) → s = ArraySum.sum a i j))) ∧ (o1 + (1 : ℤ) < i → (0 : ℤ) = ArraySum.sum a i j)
  := sorry
end sumrange_Simple_queryqtvc
