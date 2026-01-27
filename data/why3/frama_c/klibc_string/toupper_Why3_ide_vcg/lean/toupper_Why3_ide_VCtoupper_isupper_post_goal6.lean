import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic2.Axiomatic2
open Classical
open Lean4Why3
namespace toupper_Why3_ide_VCtoupper_isupper_post_goal6
theorem goal6 (i_1 : ℤ) (i : ℤ) (fact0 : (0 : ℤ) ≤ i_1) (fact1 : i_1 ≤ (255 : ℤ)) (fact2 : Cint.is_sint32 i) (fact3 : Cint.is_sint32 i_1) (fact4 : Axiomatic2.p_is_upper (Cint.to_uint8 i_1)) : i_1 = i
  := sorry
end toupper_Why3_ide_VCtoupper_isupper_post_goal6
