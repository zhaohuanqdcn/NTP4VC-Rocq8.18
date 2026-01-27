import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace __tolower_Why3_ide_VC__tolower_post_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (fact0 : A_Ctype.p_isupper (Cint.to_sint8 i_1) = (¬i = (0 : ℤ))) (fact1 : Cint.is_uint8 i) (fact2 : Cint.is_uint8 i_1) (fact3 : Cint.is_uint8 i_2) (fact4 : if i = (0 : ℤ) then i_2 = i_1 else Cint.to_uint8 ((32 : ℤ) + i_1) = i_2) : A_Ctype.l_tolower i_1 = i_2
  := sorry
end __tolower_Why3_ide_VC__tolower_post_goal0
