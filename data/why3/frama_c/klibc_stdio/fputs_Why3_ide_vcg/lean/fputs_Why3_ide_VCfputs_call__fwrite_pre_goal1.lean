import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace fputs_Why3_ide_VCfputs_call__fwrite_pre_goal1
theorem goal1 (a_1 : Memory.addr) (a_2 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact2 : Memory.framed t_2) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_1) (fact5 : Cint.is_sint32 (A_Length.l_length t_1 a_1)) (fact6 : Axiomatic.p_length_of_str_is t t_1 a_1 i) : Memory.shift a (0 : ℤ) = a_2
  := sorry
end fputs_Why3_ide_VCfputs_call__fwrite_pre_goal1
