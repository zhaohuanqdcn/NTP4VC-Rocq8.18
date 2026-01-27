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
namespace strncasecmp_Why3_ide_VCstrncasecmp_loop_assign_part9_goal16
theorem goal16 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (a_3 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Cint.to_uint8 x; let x_2 : ℤ := t_1 a_1; let x_3 : ℤ := Cint.to_uint8 x_2; let x_4 : ℤ := A_Ctype.l_tolower x_2; let x_5 : ℤ := A_Ctype.l_tolower x; let x_6 : ℤ := Memory.addr.offset a; let x_7 : ℤ := Memory.addr.offset a_2; let x_8 : ℤ := i + x_6 - x_7; let x_9 : ℤ := A_Strnlen.l_strnlen t_1 a_2 x_8; let x_10 : ℤ := A_Strnlen.l_strnlen t_1 a_3 x_8; ¬x_1 = (0 : ℤ) → ¬x_3 = (0 : ℤ) → ¬x_3 = x_1 → Cint.to_uint8 x_4 = Cint.to_uint8 x_5 → ¬Cint.to_uint64 (i - (1 : ℤ)) = (0 : ℤ) → ¬i + x_6 = x_7 → Memory.addr.offset a_1 + x_7 = x_6 + Memory.addr.offset a_3 → x_6 + x_9 = x_7 + A_Strnlen.l_strnlen t_1 a i → x_6 + x_10 = x_7 + A_Strnlen.l_strnlen t_1 a_1 i → (0 : ℤ) ≤ i → x_7 ≤ x_6 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → Memory.addr_le a_2 a → Memory.addr_le a_3 a_1 → Cint.is_sint8 x → Cint.is_sint8 x_2 → Cint.is_sint8 x_5 → Cint.is_sint8 x_4 → A_Strnlen.p_valid_strn t t_1 a i → A_Strnlen.p_valid_strn t t_1 a_1 i → Cint.is_uint64 x_8 → A_Strnlen.p_valid_strn t t_1 a_2 x_8 → A_Strnlen.p_valid_strn t t_1 a_3 x_8 → Memory.addr_le a (Memory.shift a_2 x_9) → Memory.addr_le a_1 (Memory.shift a_3 x_10) → ¬(∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_7 < x_6 → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_1)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_1)))
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_loop_assign_part9_goal16
