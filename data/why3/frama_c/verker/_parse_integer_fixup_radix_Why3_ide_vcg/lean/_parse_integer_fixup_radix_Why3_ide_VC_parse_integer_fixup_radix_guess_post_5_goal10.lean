import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
import frama_c.verker.lib.lean.A_IntBase.A_IntBase
open Classical
open Lean4Why3
namespace _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_guess_post_5_goal10
theorem goal10 (a : Memory.addr) (t_8 : Memory.addr -> ℤ) (t_6 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_5 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i : ℤ) (t_7 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_4 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t_9 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_8 a_3; let x_1 : ℤ := t_6 a_3; let x_2 : ℤ := A_Ctype.l_tolower x_1; t_1 a_1 = (0 : ℤ) → t_5 a_1 = (16 : ℤ) → t_6 a_2 = (48 : ℤ) → t_8 a_2 = (48 : ℤ) → A_Ctype.l_tolower x = (120 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_6 → Cint.is_uint8 i → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 x_1 → Cint.is_sint8 x → Memory.valid_rd t a_2 (3 : ℤ) → Cint.is_sint8 x_2 → (if x_2 = (120 : ℤ) then A_Ctype.p_isxdigit (t_7 (Memory.shift a (2 : ℤ))) = (¬i = (0 : ℤ)) ∧ (if i = (0 : ℤ) then Function.update t_3 a_1 (8 : ℤ) = t_5 else Function.update t_4 a_1 (16 : ℤ) = t_5) else Function.update t_2 a_1 (8 : ℤ) = t_5) → ¬(A_IntBase.p_is_oct t_9 a ∨ A_IntBase.p_is_dec t_9 a)
  := sorry
end _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_guess_post_5_goal10
