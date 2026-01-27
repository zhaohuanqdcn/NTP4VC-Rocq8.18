import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace TwoEqualElements
noncomputable def appear_twice (a : List ℤ) (v : ℤ) (u : ℤ) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < u) ∧ a[Int.toNat i]! = v ∧ (∃(j : ℤ), ((0 : ℤ) ≤ j ∧ j < u) ∧ ¬j = i ∧ a[Int.toNat j]! = v)
end TwoEqualElements
