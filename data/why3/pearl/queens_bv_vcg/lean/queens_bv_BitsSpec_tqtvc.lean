import Why3.Base
import pearl.queens_bv_vcg.lean.queens_bv.S
open Classical
open Lean4Why3
namespace queens_bv_BitsSpec_tqtvc
theorem t'vc : ∃(mdl : Finset ℤ), ∀(i : ℤ), i ∈ mdl → (0 : ℤ) ≤ i ∧ i < (32 : ℤ)
  := sorry
end queens_bv_BitsSpec_tqtvc
