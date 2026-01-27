import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace isdigit_Why3_ide_VCisdigit_post_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (fact0 : Cint.is_sint32 i) (fact1 : Cint.is_sint32 i_1) (fact2 : if (48 : ℤ) ≤ i_1 then if i_1 ≤ (57 : ℤ) then i = (1 : ℤ) else i = (0 : ℤ) else i = (0 : ℤ)) : A_Ctype.p_isdigit i_1 = (¬i = (0 : ℤ))
  := sorry
end isdigit_Why3_ide_VCisdigit_post_goal0
