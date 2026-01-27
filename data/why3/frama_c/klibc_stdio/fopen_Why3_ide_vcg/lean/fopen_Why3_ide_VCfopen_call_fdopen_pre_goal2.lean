import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Globals.Globals
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace fopen_Why3_ide_VCfopen_call_fdopen_pre_goal2
theorem goal2 (i_5 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_3 : ℤ) (i_4 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (fact0 : (0 : ℤ) ≤ i_5) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact3 : Memory.framed t_2) (fact4 : Memory.linked t) (fact5 : Memory.sconst t_1) (fact6 : Cint.is_sint32 i_5) (fact7 : Axiomatic.p_length_of_str_is t t_1 a i) (fact8 : Axiomatic.p_length_of_str_is t t_1 a i_3) (fact9 : Axiomatic.p_length_of_str_is t t_1 a i_4) (fact10 : Axiomatic.p_length_of_str_is t t_1 a_1 i_1) (fact11 : Axiomatic.p_length_of_str_is t t_1 a_1 i_2) : Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∨ (∃(i_6 : ℤ), Axiomatic.p_length_of_str_is (Function.update t (38235 : ℤ) (1 : ℤ)) t_1 a i_6)
  := sorry
end fopen_Why3_ide_VCfopen_call_fdopen_pre_goal2
