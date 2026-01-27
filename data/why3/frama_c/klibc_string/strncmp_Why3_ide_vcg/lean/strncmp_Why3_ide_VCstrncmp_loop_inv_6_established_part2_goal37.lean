import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_loop_inv_6_established_part2_goal37
theorem goal37 (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Memory.valid_rw t a_2 i → Memory.valid_rw t a_3 i → Memory.separated a_2 i a_3 i → Memory.addr_le a_1 (Memory.shift a_1 i)
  := sorry
end strncmp_Why3_ide_VCstrncmp_loop_inv_6_established_part2_goal37
