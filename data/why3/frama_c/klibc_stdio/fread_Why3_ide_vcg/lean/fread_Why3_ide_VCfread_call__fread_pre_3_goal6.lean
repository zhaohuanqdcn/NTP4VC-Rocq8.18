import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace fread_Why3_ide_VCfread_call__fread_pre_3_goal6
theorem goal6 (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact2 : Memory.framed t_1) (fact3 : Memory.linked t) : Memory.shift a (0 : ℤ) = a_2
  := sorry
end fread_Why3_ide_VCfread_call__fread_pre_3_goal6
