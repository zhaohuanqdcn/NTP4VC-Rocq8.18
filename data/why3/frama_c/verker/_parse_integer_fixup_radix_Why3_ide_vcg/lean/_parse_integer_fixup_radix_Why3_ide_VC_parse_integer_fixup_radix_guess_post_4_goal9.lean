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
namespace _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_guess_post_4_goal9
theorem goal9 (t_6 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t_7 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t_13 : Memory.addr -> ℤ) (t_8 : Memory.addr -> ℤ) (p : Bool) (p_2 : Bool) (t_9 : Memory.addr -> ℤ) (t_4 : Memory.addr -> ℤ) (t_5 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t_10 : Memory.addr -> ℤ) (p_1 : Bool) (p_3 : Bool) (t_11 : Memory.addr -> ℤ) (t_12 : Memory.addr -> ℤ) (a_2 : Memory.addr) : let x : ℤ := t_6 a_1; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let x_1 : ℤ := t_7 a_3; let a_4 : Memory.addr := Memory.shift a (1 : ℤ); let a_5 : Memory.addr := Memory.shift a (2 : ℤ); t_1 a_1 = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_7 → Cint.is_uint8 i → Cint.is_sint8 i_1 → Cint.is_sint8 i_2 → Cint.is_uint32 x → A_IntBase.p_is_hex t_13 a → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 x_1 → Memory.valid_rd t a_3 (3 : ℤ) → (if x_1 = (48 : ℤ) then t_8 = t_7 ∧ A_Ctype.l_tolower (t_8 a_4) = i_1 ∧ (if i_1 = (120 : ℤ) then p = true ∧ p_2 = true ∧ A_Ctype.p_isxdigit (t_9 a_5) = (¬i = (0 : ℤ)) ∧ (if i = (0 : ℤ) then Function.update t_4 a_1 (8 : ℤ) = t_6 else Function.update t_5 a_1 (16 : ℤ) = t_6) else p = true ∧ p_2 = true ∧ Function.update t_3 a_1 (8 : ℤ) = t_6) else p = true ∧ p_2 = true ∧ t_2 = t_1 ∧ t_10 = t_7 ∧ Function.update t_2 a_1 (10 : ℤ) = t_6) → (if x = (16 : ℤ) then (p_1 = true) = (p = true) ∧ (p_3 = true) = (p_2 = true) ∧ t_11 = t_10 ∧ (if t_11 a_3 = (48 : ℤ) then p_1 = true ∧ p_3 = true ∧ t_12 = t_11 ∧ A_Ctype.l_tolower (t_12 a_4) = i_2 ∧ (if i_2 = (120 : ℤ) then a_5 = a_2 else a_2 = a) else p_1 = true ∧ p_3 = true ∧ a_2 = a ∧ t_13 = t_11) else p = true ∧ p_2 = true ∧ a_2 = a ∧ t_13 = t_10) → a_5 = a_2
  := sorry
end _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_guess_post_4_goal9
