import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace fopen_Why3_ide_VCfopen_call___parse_open_mode_pre_goal1
theorem goal1 (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.framed t_2) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_1) (fact5 : Axiomatic.p_length_of_str_is t t_1 a i) (fact6 : Axiomatic.p_length_of_str_is t t_1 a i_3) (fact7 : Axiomatic.p_length_of_str_is t t_1 a_1 i_1) (fact8 : Axiomatic.p_length_of_str_is t t_1 a_1 i_2) : ∃(i_4 : ℤ), Axiomatic.p_length_of_str_is t t_1 a i_4
  := sorry
end fopen_Why3_ide_VCfopen_call___parse_open_mode_pre_goal1
