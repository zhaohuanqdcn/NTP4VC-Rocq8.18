import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace strncasecmp_Why3_ide_VCstrncasecmp_assign_exit_part10_goal18
theorem goal18 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (a_3 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Cint.to_uint8 x; let x_2 : ℤ := t_1 a_1; let x_3 : ℤ := Cint.to_uint8 x_2; let x_4 : ℤ := Memory.addr.offset a_2; let x_5 : ℤ := Memory.addr.offset a; let x_6 : ℤ := i + x_4 - x_5; let x_7 : ℤ := A_Strnlen.l_strnlen t_1 a_2 i; let x_8 : ℤ := A_Strnlen.l_strnlen t_1 a_3 i; ¬i = (0 : ℤ) → ¬x_1 = (0 : ℤ) → ¬x_3 = (0 : ℤ) → ¬x_3 = x_1 → Memory.addr.offset a_1 + x_4 = x_5 + Memory.addr.offset a_3 → x_4 + A_Strnlen.l_strnlen t_1 a x_6 = x_5 + x_7 → x_4 + A_Strnlen.l_strnlen t_1 a_1 x_6 = x_5 + x_8 → x_4 ≤ x_5 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → x_5 ≤ i + x_4 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → Memory.addr_le a_2 a → Memory.addr_le a_3 a_1 → Cint.is_sint8 x → Cint.is_sint8 x_2 → Cint.is_sint8 (A_Ctype.l_tolower x_2) → A_Strnlen.p_valid_strn t t_1 a_2 i → A_Strnlen.p_valid_strn t t_1 a_3 i → Cint.is_uint64 x_6 → Memory.addr_le a (Memory.shift a_2 x_7) → Memory.addr_le a_1 (Memory.shift a_3 x_8) → A_Strnlen.p_valid_strn t t_1 a x_6 → A_Strnlen.p_valid_strn t t_1 a_1 x_6 → ¬(∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_4 < x_5 → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_1)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_1)))
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_assign_exit_part10_goal18
