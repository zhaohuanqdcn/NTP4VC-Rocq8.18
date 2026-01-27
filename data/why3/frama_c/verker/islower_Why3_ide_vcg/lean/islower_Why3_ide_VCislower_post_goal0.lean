import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace islower_Why3_ide_VCislower_post_goal0
theorem goal0 (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := t (Cint.to_uint8 i); Cint.is_sint8 i → Cint.is_uint8 x → Cbits.bit_test x (1 : ℤ) = A_Ctype.p_islower i
  := sorry
end islower_Why3_ide_VCislower_post_goal0
