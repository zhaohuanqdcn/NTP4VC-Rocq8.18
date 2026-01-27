import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strndup_Why3_ide_VCstrndup_call_strnlen_pre_2_goal1
theorem goal1 (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Cint.is_uint32 i) : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i
  := sorry
end strndup_Why3_ide_VCstrndup_call_strnlen_pre_2_goal1
