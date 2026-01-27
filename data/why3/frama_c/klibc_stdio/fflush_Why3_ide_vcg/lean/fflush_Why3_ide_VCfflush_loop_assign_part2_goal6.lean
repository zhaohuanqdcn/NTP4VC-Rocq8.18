import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Globals.Globals
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fflush_Why3_ide_VCfflush_loop_assign_part2_goal6
theorem goal6 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_2 (8 : ℤ)); ¬Memory.addr.mk (1723 : ℤ) (0 : ℤ) = a_2 → ¬x = (0 : ℤ) → Memory.region (0 : ℤ) ≤ (0 : ℤ) → -(1 : ℤ) ≤ i → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → ¬Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_2
  := sorry
end fflush_Why3_ide_VCfflush_loop_assign_part2_goal6
