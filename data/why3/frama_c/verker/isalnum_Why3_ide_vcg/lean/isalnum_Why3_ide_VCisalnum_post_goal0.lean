import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
import Why3.Cbits.Cbits
open Classical
open Lean4Why3
namespace isalnum_Why3_ide_VCisalnum_post_goal0
theorem goal0 (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := t (Cint.to_uint8 i); Cint.is_sint8 i → Cint.is_uint8 x → A_Ctype.p_isalnum i = (¬Cbits.land (7 : ℤ) x = (0 : ℤ))
  := sorry
end isalnum_Why3_ide_VCisalnum_post_goal0
