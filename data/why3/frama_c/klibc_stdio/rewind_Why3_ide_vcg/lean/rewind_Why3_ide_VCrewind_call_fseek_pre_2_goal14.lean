import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace rewind_Why3_ide_VCrewind_call_fseek_pre_2_goal14
theorem goal14 (a_2 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_4 : Memory.addr) : let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); a_5 = Memory.shift a (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → Axiomatic3.p_valid_file t t_1 a_5 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_4
  := sorry
end rewind_Why3_ide_VCrewind_call_fseek_pre_2_goal14
