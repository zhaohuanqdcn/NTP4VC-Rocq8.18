import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace fread_Why3_ide_VCfread_call__fread_pre_2_part1_goal0
theorem goal0 (a_2 : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ)) (fact2 : Memory.framed t_1) (fact3 : Memory.linked t) : Memory.separated (t_1 (Memory.shift a_1 (4 : ℤ))) (11 : ℤ) (t_1 (Memory.shift a (3 : ℤ))) (11 : ℤ)
  := sorry
end fread_Why3_ide_VCfread_call__fread_pre_2_part1_goal0
