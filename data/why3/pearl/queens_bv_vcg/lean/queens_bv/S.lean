import Why3.Base
open Classical
open Lean4Why3
namespace S
axiom succ : Finset ℤ -> Finset ℤ
axiom succ_def (i : ℤ) (s : Finset ℤ) : (i ∈ succ s) = ((1 : ℤ) ≤ i ∧ i - (1 : ℤ) ∈ s)
axiom pred : Finset ℤ -> Finset ℤ
axiom pred_def (i : ℤ) (s : Finset ℤ) : (i ∈ pred s) = ((0 : ℤ) ≤ i ∧ i + (1 : ℤ) ∈ s)
end S
