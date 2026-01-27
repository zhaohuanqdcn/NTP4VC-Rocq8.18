import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strnchr_Why3_ide_VCstrnchr_exists_post_goal10
theorem goal10 (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 a_3; let x_1 : ℤ := Memory.addr.offset a_1; let x_2 : ℤ := Memory.addr.offset a_2; let x_3 : ℤ := i + x_2 - x_1; let x_4 : ℤ := A_Strnlen.l_strnlen t_1 a_2 i; let x_5 : ℤ := i + x_2; let x_6 : ℤ := t_1 a; let x_7 : ℤ := t_1 a_1; let a_4 : Memory.addr := Memory.shift a_2 x_4; x = Cint.to_sint8 i_1 → x_1 + A_Strnlen.l_strnlen t_1 a_1 x_3 = x_2 + x_4 → x_2 ≤ x_1 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x_1 ≤ x_5 → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_1 → Cint.is_uint64 i → Memory.addr_le a_2 a_1 → Memory.addr_le a_2 a_3 → Cint.is_sint8 x_6 → Cint.is_sint8 x_7 → A_Strnlen.p_valid_strn t t_1 a_2 i → Cint.is_uint64 x_3 → Memory.addr_lt a_3 a_4 → Memory.addr_le a_1 a_4 → A_Strnlen.p_valid_strn t t_1 a_1 x_3 → (if x_5 = x_1 then Memory.addr.mk (0 : ℤ) (0 : ℤ) = a else if x_7 = (0 : ℤ) then Memory.addr.mk (0 : ℤ) (0 : ℤ) = a else a_1 = a ∧ x = x_6) → (∀(a_5 : Memory.addr), Memory.addr_lt a_5 a_1 → Memory.addr_le a_2 a_5 → ¬x = t_1 a_5) → Memory.addr_le a_2 a ∧ Memory.addr_le a a_4
  := sorry
end strnchr_Why3_ide_VCstrnchr_exists_post_goal10
