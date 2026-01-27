import Why3.Base
import Why3.why3.WellFounded.WellFounded
import pearl.queens_bv_vcg.lean.queens_bv.S
open Classical
open Lean4Why3
namespace queens_bv_Bits_tqtvc
theorem t'vc : ∃(bv : BitVec 32) (mdl : Finset ℤ), ∀(i : ℤ), (((0 : ℤ) ≤ i ∧ i < (32 : ℤ)) ∧ bv[Int.toNat i]! = true) = (i ∈ mdl)
  := sorry
end queens_bv_Bits_tqtvc
