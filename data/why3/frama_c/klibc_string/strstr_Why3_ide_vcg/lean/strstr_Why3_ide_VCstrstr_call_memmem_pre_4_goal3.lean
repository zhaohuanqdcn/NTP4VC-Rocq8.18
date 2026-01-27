import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strstr_Why3_ide_VCstrstr_call_memmem_pre_4_goal3
theorem goal3 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := A_Length.l_length t_1 a; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 x → Cint.is_sint32 (A_Length.l_length t_1 a_1) → Axiomatic.p_length_of_str_is t t_1 a i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) (Cint.to_uint32 x)
  := sorry
end strstr_Why3_ide_VCstrstr_call_memmem_pre_4_goal3
