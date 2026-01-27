import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace fread_Why3_ide_VCfread_call__fread_pre_5_goal8
theorem goal8 (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.framed t_1) (fact3 : Memory.linked t) (fact4 : Cint.is_uint32 i) (fact5 : Cint.is_uint32 i_1) : Memory.valid_rw t (Memory.shift a (0 : ℤ)) (Cint.to_uint32 (i * i_1))
  := sorry
end fread_Why3_ide_VCfread_call__fread_pre_5_goal8
