import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_assign_exit_part2_goal1
theorem goal1 (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i : ℤ) (t_3 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_2 (Memory.shift a (1 : ℤ)); t_1 a_1 = (0 : ℤ) → t_2 a_2 = (48 : ℤ) → A_Ctype.l_tolower x = (120 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint8 i_1 → Cint.is_sint32 i → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 x → Cint.is_sint8 (t_3 (Memory.shift a (2 : ℤ))) → ¬Memory.valid_rd t a_2 (3 : ℤ)
  := sorry
end _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_assign_exit_part2_goal1
