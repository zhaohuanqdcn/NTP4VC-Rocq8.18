import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strerror_Why3_ide_VCstrerror_call_memcpy_pre_4_goal2
theorem goal2 (i_1 : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (t_1 : ℤ -> ℤ) (a : Memory.addr) (i : ℤ) (fact0 : Cint.to_uint32 (Int.tdiv i_1 (10 : ℤ)) = (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_2) (fact3 : Cint.is_uint32 i_1) : Memory.valid_rw t_1 (Memory.shift a (-(1 : ℤ))) (Cint.to_uint32 i)
  := sorry
end strerror_Why3_ide_VCstrerror_call_memcpy_pre_4_goal2
