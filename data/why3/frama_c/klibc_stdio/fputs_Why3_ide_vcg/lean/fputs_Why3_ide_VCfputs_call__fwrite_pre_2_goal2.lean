import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.A_Length.A_Length
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fputs_Why3_ide_VCfputs_call__fwrite_pre_2_goal2
theorem goal2 (a_1 : Memory.addr) (a_2 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact2 : Memory.framed t_3) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_2) (fact5 : Cint.is_sint32 (A_Length.l_length t_2 a_1)) (fact6 : Axiomatic.p_length_of_str_is t t_2 a_1 i) : Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a
  := sorry
end fputs_Why3_ide_VCfputs_call__fwrite_pre_2_goal2
