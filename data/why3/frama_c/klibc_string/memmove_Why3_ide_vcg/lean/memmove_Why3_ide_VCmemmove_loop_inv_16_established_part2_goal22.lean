import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_loop_inv_16_established_part2_goal22
theorem goal22 (a : Memory.addr) (i : ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a i; (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → ¬Memory.addr_lt a_1 a → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i → Memory.addr_le a_2 a_2
  := sorry
end memmove_Why3_ide_VCmemmove_loop_inv_16_established_part2_goal22
