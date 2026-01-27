import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strncat_Why3_ide_VCstrncat_call_strchr_pre_goal17
theorem goal17 (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ i_1) (fact2 : i_1 < i) (fact3 : (0 : ℤ) ≤ i_2) (fact4 : i_2 < i) (fact5 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact6 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact7 : Memory.linked t) (fact8 : Memory.sconst t_1) (fact9 : Cint.is_uint32 i) (fact10 : Axiomatic.p_length_of_str_is t t_1 a_1 i_1) (fact11 : Axiomatic.p_length_of_str_is t t_1 a_1 i_2) : ∃(i_3 : ℤ), Axiomatic.p_length_of_str_is t t_1 a_1 i_3
  := sorry
end strncat_Why3_ide_VCstrncat_call_strchr_pre_goal17
