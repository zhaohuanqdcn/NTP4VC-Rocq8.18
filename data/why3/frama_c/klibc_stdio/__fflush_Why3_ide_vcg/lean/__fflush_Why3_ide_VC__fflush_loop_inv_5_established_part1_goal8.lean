import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __fflush_Why3_ide_VC__fflush_loop_inv_5_established_part1_goal8
theorem goal8 (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := t_2 (Memory.shift a (5 : ℤ)); t_1 (Memory.shift a (7 : ℤ)) = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 (t_1 (Memory.shift a (9 : ℤ))) → Cint.is_uint32 (t_1 (Memory.shift a (8 : ℤ))) → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a → Memory.addr_le a_1 a_1
  := sorry
end __fflush_Why3_ide_VC__fflush_loop_inv_5_established_part1_goal8
