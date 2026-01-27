import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace esterel_Esterel_sqtvc
theorem s'vc : ∃(bv : BitVec 64) (mdl : Finset ℤ), ∀(i : ℤ), (((0 : ℤ) ≤ i ∧ i < (64 : ℤ)) ∧ bv[Int.toNat i]! = true) = (i ∈ mdl)
  := sorry
end esterel_Esterel_sqtvc
