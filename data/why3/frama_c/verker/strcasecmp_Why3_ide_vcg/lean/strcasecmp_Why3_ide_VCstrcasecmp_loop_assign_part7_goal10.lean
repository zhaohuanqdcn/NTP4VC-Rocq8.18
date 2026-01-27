import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strcasecmp_Why3_ide_VCstrcasecmp_loop_assign_part7_goal10
theorem goal10 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_2 a; let x_1 : ℤ := A_Ctype.l_tolower x; let x_2 : ℤ := t_1 a_1; let x_3 : ℤ := Memory.addr.offset a_1; let x_4 : ℤ := Memory.addr.offset a_3; ¬x_1 = (0 : ℤ) → x_1 = A_Ctype.l_tolower x_2 → x_3 + Memory.addr.offset a_2 = Memory.addr.offset a + x_4 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_2 a → Memory.addr_le a_3 a_1 → Cint.is_sint8 x_2 → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Cint.is_sint8 x_1 → Cint.is_sint32 x_1 → Memory.addr_le a (Memory.shift a_2 (A_Strlen.l_strlen t_1 a_2)) → Memory.addr_le a_1 (Memory.shift a_3 (A_Strlen.l_strlen t_1 a_3)) → ¬(∀(i : ℤ), (0 : ℤ) ≤ i → i + x_4 < x_3 → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i)))
  := sorry
end strcasecmp_Why3_ide_VCstrcasecmp_loop_assign_part7_goal10
