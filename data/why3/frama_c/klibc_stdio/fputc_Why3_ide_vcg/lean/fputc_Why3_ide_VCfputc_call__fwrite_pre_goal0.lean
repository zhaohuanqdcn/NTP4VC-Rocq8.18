import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace fputc_Why3_ide_VCfputc_call__fwrite_pre_goal0
theorem goal0 (a_1 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.framed t_1) (fact2 : Memory.linked t) : Memory.shift a (0 : ℤ) = a_1
  := sorry
end fputc_Why3_ide_VCfputc_call__fwrite_pre_goal0
