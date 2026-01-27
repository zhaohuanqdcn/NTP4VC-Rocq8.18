import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Globals.Globals
open Classical
open Lean4Why3
namespace fputc_Why3_ide_VCfputc_call__fwrite_pre_3_goal2
theorem goal2 (a_1 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.framed t_1) (fact2 : Memory.linked t) : Memory.valid_rw (Function.update t (20235 : ℤ) (1 : ℤ)) (Memory.shift a (0 : ℤ)) (1 : ℤ)
  := sorry
end fputc_Why3_ide_VCfputc_call__fwrite_pre_3_goal2
