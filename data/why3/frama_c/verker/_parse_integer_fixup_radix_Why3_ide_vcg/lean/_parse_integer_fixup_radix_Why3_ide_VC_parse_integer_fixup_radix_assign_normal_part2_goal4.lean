import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_assign_normal_part2_goal4
theorem goal4 (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_2 (Memory.shift a (1 : ℤ)); let x_1 : ℤ := t_3 (Memory.shift a (2 : ℤ)); t_1 a_1 = (0 : ℤ) → t_2 a_2 = (48 : ℤ) → A_Ctype.l_tolower x = (120 : ℤ) → A_Ctype.p_isxdigit x_1 = (¬i = (0 : ℤ)) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint8 i → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 x → Cint.is_sint8 x_1 → ¬Memory.valid_rd t a_2 (3 : ℤ)
  := sorry
end _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_assign_normal_part2_goal4
