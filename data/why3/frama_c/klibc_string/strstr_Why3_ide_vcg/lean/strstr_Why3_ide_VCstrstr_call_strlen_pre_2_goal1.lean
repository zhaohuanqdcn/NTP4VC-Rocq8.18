import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strstr_Why3_ide_VCstrstr_call_strlen_pre_2_goal1
theorem goal1 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Cint.is_sint32 (A_Length.l_length t_1 a)) (fact5 : Axiomatic.p_length_of_str_is t t_1 a i) : ∃(i_1 : ℤ), Axiomatic.p_length_of_str_is t t_1 a_1 i_1
  := sorry
end strstr_Why3_ide_VCstrstr_call_strlen_pre_2_goal1
