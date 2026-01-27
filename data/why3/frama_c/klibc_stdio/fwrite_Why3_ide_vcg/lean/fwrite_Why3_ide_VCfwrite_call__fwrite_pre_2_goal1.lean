import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fwrite_Why3_ide_VCfwrite_call__fwrite_pre_2_goal1
theorem goal1 (a_1 : Memory.addr) (a_2 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact2 : Memory.framed t_2) (fact3 : Memory.linked t) : Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a
  := sorry
end fwrite_Why3_ide_VCfwrite_call__fwrite_pre_2_goal1
