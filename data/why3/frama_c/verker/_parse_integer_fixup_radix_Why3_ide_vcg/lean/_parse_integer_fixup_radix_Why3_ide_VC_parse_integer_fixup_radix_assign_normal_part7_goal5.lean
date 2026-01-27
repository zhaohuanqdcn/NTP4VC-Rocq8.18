import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_assign_normal_part7_goal5
theorem goal5 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_9 : Memory.addr -> ℤ) (t_10 : Memory.addr -> ℤ) (t_11 : Memory.addr -> ℤ) (t_12 : Memory.addr -> ℤ) (t_7 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (t_8 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t_2 : Memory.addr -> ℤ) (t_5 : Memory.addr -> ℤ) (t_6 : Memory.addr -> ℤ) (t_4 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_1 a_1; let x_1 : ℤ := t_9 a_2; let a_3 : Memory.addr := Memory.shift a (1 : ℤ); let x_2 : ℤ := t_10 a_3; let x_3 : ℤ := t_11 (Memory.shift a (2 : ℤ)); let x_4 : ℤ := t_12 a_3; t_7 a_1 = (16 : ℤ) → t_12 a_2 = (48 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_8 → Cint.is_uint8 i → Cint.is_sint8 i_1 → Cint.is_uint32 x → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 x_1 → Cint.is_sint8 x_2 → Cint.is_sint8 x_3 → Cint.is_sint8 x_4 → Memory.valid_rd t a_2 (3 : ℤ) → Cint.is_sint8 (A_Ctype.l_tolower x_4) → ¬(if x = (0 : ℤ) then t_2 = t_1 ∧ t_9 = t_8 ∧ (if x_1 = (48 : ℤ) then t_10 = t_9 ∧ A_Ctype.l_tolower x_2 = i_1 ∧ (if i_1 = (120 : ℤ) then A_Ctype.p_isxdigit x_3 = (¬i = (0 : ℤ)) ∧ (if i = (0 : ℤ) then Function.update t_5 a_1 (8 : ℤ) = t_7 else Function.update t_6 a_1 (16 : ℤ) = t_7) else Function.update t_4 a_1 (8 : ℤ) = t_7) else t_3 = t_2 ∧ t_12 = t_9 ∧ Function.update t_3 a_1 (10 : ℤ) = t_7) else t_7 = t_1 ∧ t_12 = t_8)
  := sorry
end _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_assign_normal_part7_goal5
