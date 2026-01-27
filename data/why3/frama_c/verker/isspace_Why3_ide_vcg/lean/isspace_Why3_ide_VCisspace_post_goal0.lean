import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace isspace_Why3_ide_VCisspace_post_goal0
theorem goal0 (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := t (Cint.to_uint8 i); Cint.is_sint8 i → Cint.is_uint8 x → Cbits.bit_test x (5 : ℤ) = A_Ctype.p_isspace i
  := sorry
end isspace_Why3_ide_VCisspace_post_goal0
