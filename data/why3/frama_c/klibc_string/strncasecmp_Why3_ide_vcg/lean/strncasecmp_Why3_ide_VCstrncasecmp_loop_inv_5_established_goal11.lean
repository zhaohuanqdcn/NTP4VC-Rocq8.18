import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strncasecmp_Why3_ide_VCstrncasecmp_loop_inv_5_established_goal11
theorem goal11 (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i_4 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (a : Memory.addr) (a_3 : Memory.addr) : let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); (0 : ℤ) < i → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Axiomatic.p_length_of_str_is t t_1 a_1 i_4 → Axiomatic.p_length_of_str_is t t_1 a_2 i_2 → Axiomatic.p_length_of_str_is t t_1 a_2 i_3 → Memory.valid_rw t a_4 i → Memory.valid_rw t a_5 i → Memory.separated a_5 i a_4 i → Memory.shift a (0 : ℤ) = a_3
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_loop_inv_5_established_goal11
