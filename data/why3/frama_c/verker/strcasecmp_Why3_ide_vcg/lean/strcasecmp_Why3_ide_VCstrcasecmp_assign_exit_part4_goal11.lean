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
namespace strcasecmp_Why3_ide_VCstrcasecmp_assign_exit_part4_goal11
theorem goal11 (a_1 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := Memory.addr.offset a_3; x + Memory.addr.offset a_2 = Memory.addr.offset a + x_1 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_2 a → Memory.addr_le a_3 a_1 → Cint.is_sint8 (t_1 a_1) → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Memory.addr_le a (Memory.shift a_2 (A_Strlen.l_strlen t_1 a_2)) → Memory.addr_le a_1 (Memory.shift a_3 (A_Strlen.l_strlen t_1 a_3)) → ¬(∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_1 < x → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_1)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_1)))
  := sorry
end strcasecmp_Why3_ide_VCstrcasecmp_assign_exit_part4_goal11
