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
namespace strnchr_Why3_ide_VCstrnchr_loop_inv_2_established_goal3
theorem goal3 (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Cint.is_uint64 i) (fact4 : A_Strnlen.p_valid_strn t t_1 a i) : Memory.addr_le a a ∧ Memory.addr_le a (Memory.shift a (A_Strnlen.l_strnlen t_1 a i))
  := sorry
end strnchr_Why3_ide_VCstrnchr_loop_inv_2_established_goal3
