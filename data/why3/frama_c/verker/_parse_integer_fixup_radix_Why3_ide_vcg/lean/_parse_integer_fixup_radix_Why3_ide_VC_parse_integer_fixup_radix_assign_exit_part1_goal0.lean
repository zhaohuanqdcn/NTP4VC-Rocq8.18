import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_assign_exit_part1_goal0
theorem goal0 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i : ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); t_1 a_1 = (0 : ℤ) → t_2 a_2 = (48 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 (t_2 (Memory.shift a (1 : ℤ))) → ¬Memory.valid_rd t a_2 (3 : ℤ)
  := sorry
end _parse_integer_fixup_radix_Why3_ide_VC_parse_integer_fixup_radix_assign_exit_part1_goal0
