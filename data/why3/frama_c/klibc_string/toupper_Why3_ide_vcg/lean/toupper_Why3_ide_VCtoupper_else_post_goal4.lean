import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic2.Axiomatic2
open Classical
open Lean4Why3
namespace toupper_Why3_ide_VCtoupper_else_post_goal4
theorem goal4 (i_1 : ℤ) (i : ℤ) : let x : ℤ := Cint.to_uint8 i_1; (0 : ℤ) ≤ i_1 → i_1 ≤ (255 : ℤ) → Cint.is_sint32 i → Cint.is_sint32 i_1 → ¬Axiomatic2.p_is_lower x → ¬Axiomatic2.p_is_upper x → i_1 = i
  := sorry
end toupper_Why3_ide_VCtoupper_else_post_goal4
