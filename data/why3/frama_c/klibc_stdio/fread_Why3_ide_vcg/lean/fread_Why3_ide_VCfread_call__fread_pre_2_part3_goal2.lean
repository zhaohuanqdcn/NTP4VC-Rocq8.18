import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace fread_Why3_ide_VCfread_call__fread_pre_2_part3_goal2
theorem goal2 (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact2 : Memory.framed t_1) (fact3 : Memory.linked t) (fact4 : Cint.is_uint32 i) (fact5 : Cint.is_uint32 i_1) : Memory.separated (Memory.shift a_1 (0 : ℤ)) (Cint.to_uint32 (i * i_1)) (t_1 (Memory.shift a (3 : ℤ))) (11 : ℤ)
  := sorry
end fread_Why3_ide_VCfread_call__fread_pre_2_part3_goal2
