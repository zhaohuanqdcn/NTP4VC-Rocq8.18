import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace fputs_Why3_ide_VCfputs_call__fwrite_pre_3_goal3
theorem goal3 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := A_Length.l_length t_1 a; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 x → Axiomatic.p_length_of_str_is t t_1 a i → Memory.valid_rw t (Memory.shift a (0 : ℤ)) (Cint.to_uint32 x)
  := sorry
end fputs_Why3_ide_VCfputs_call__fwrite_pre_3_goal3
