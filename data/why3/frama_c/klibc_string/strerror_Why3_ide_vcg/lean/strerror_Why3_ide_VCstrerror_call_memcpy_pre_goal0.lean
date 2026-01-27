import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.Globals.Globals
open Classical
open Lean4Why3
namespace strerror_Why3_ide_VCstrerror_call_memcpy_pre_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) : let x : ℤ := Cint.to_uint32 i; Cint.to_uint32 (Int.tdiv i_1 (10 : ℤ)) = (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i_1 → Memory.separated (Memory.shift a (-(1 : ℤ))) x (Memory.shift (Memory.addr.mk (16590 : ℤ) (0 : ℤ)) (6 : ℤ)) x
  := sorry
end strerror_Why3_ide_VCstrerror_call_memcpy_pre_goal0
