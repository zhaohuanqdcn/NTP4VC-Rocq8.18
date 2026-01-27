import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strdup_Why3_ide_VCstrdup_call_memcpy_pre_4_goal6
theorem goal6 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := A_Length.l_length t_1 a; let x_1 : ℤ := (1 : ℤ) + x; let x_2 : ℤ := Cint.to_uint32 x_1; ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x_2 = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 x → Axiomatic.p_length_of_str_is t t_1 a i → Axiomatic.p_length_of_str_is t t_1 a i_1 → Axiomatic.p_length_of_str_is t t_1 a i_2 → Cint.is_sint32 x_1 → ((0 : ℤ) < x_2 → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) x_2) → Memory.valid_rw t (Memory.shift a (0 : ℤ)) x_2
  := sorry
end strdup_Why3_ide_VCstrdup_call_memcpy_pre_4_goal6
