import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace tolower_Why3_ide_VCtolower_post_goal0
theorem goal0 (i : ℤ) : let x : ℤ := A_Ctype.l_tolower (Cint.to_uint8 i); Cint.is_sint8 i → Cint.is_uint8 x → Cint.to_sint8 x = A_Ctype.l_tolower i
  := sorry
end tolower_Why3_ide_VCtolower_post_goal0
