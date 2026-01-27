import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace _tolower_Why3_ide_VC_tolower_post_goal0
theorem goal0 (i : ℤ) (fact0 : Cint.is_sint8 i) : Cint.to_sint8 (Cbits.lor (32 : ℤ) i) = A_Ctype.l_tolower i
  := sorry
end _tolower_Why3_ide_VC_tolower_post_goal0
