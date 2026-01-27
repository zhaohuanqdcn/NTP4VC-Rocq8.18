import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace MaxAndSum2
noncomputable def is_max (a : List ℤ) (l : ℤ) (h : ℤ) (m : ℤ) := (∀(k : ℤ), l ≤ k ∧ k < h → a[Int.toNat k]! ≤ m) ∧ (h ≤ l ∧ m = (0 : ℤ) ∨ l < h ∧ (∃(k : ℤ), (l ≤ k ∧ k < h) ∧ m = a[Int.toNat k]!))
end MaxAndSum2
