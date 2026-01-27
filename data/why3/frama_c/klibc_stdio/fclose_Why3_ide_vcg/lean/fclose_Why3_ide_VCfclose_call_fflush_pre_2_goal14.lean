import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fclose_Why3_ide_VCfclose_call_fflush_pre_2_goal14
theorem goal14 (a_2 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_4 : Memory.addr) (fact0 : Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact2 : Memory.framed t_2) (fact3 : Memory.linked t) (fact4 : Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1) (fact5 : Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3) : Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_4
  := sorry
end fclose_Why3_ide_VCfclose_call_fflush_pre_2_goal14
