import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic2.Axiomatic2
open Classical
open Lean4Why3
namespace toupper_Why3_ide_VCtoupper_disjoint_else_isupper_islower_goal1
theorem goal1 (i : ℤ) : let x : ℤ := Cint.to_uint8 i; (0 : ℤ) ≤ i → i ≤ (255 : ℤ) → Cint.is_sint32 i → ¬Axiomatic2.p_is_lower x ∨ ¬Axiomatic2.p_is_upper x
  := sorry
end toupper_Why3_ide_VCtoupper_disjoint_else_isupper_islower_goal1
