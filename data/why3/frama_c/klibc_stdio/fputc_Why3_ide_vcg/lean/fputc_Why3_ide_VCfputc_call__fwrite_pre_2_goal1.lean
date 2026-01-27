import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
import frama_c.klibc_stdio.lib.lean.Globals.Globals
open Classical
open Lean4Why3
namespace fputc_Why3_ide_VCfputc_call__fwrite_pre_2_goal1
theorem goal1 (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.framed t_2) (fact2 : Memory.linked t) : Axiomatic3.p_valid_io_file_pvt (Function.update t (20235 : ℤ) (1 : ℤ)) t_2 t_1 a
  := sorry
end fputc_Why3_ide_VCfputc_call__fwrite_pre_2_goal1
