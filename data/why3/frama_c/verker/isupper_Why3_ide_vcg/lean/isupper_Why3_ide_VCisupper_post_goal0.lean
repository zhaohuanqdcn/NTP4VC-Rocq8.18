import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace isupper_Why3_ide_VCisupper_post_goal0
theorem goal0 (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := t (Cint.to_uint8 i); Cint.is_sint8 i → Cint.is_uint8 x → Cbits.bit_test x (0 : ℤ) = A_Ctype.p_isupper i
  := sorry
end isupper_Why3_ide_VCisupper_post_goal0
