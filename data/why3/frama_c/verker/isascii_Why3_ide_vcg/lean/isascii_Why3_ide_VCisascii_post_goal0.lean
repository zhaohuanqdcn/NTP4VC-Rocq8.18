import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace isascii_Why3_ide_VCisascii_post_goal0
theorem goal0 (i : ℤ) (fact0 : Cint.is_sint8 i) : ((0 : ℤ) ≤ i ∧ i ≤ (127 : ℤ)) = (Cint.to_uint8 i ≤ (127 : ℤ))
  := sorry
end isascii_Why3_ide_VCisascii_post_goal0
