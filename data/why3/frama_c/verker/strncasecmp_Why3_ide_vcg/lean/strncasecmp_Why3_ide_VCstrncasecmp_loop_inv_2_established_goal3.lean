import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strncasecmp_Why3_ide_VCstrncasecmp_loop_inv_2_established_goal3
theorem goal3 (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : ¬i = (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_1) (fact5 : Cint.is_uint64 i) (fact6 : A_Strnlen.p_valid_strn t t_1 a i) (fact7 : A_Strnlen.p_valid_strn t t_1 a_1 i) : Memory.addr_le a_1 a_1 ∧ Memory.addr_le a_1 (Memory.shift a_1 (A_Strnlen.l_strnlen t_1 a_1 i))
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_loop_inv_2_established_goal3
