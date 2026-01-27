import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strchr_Why3_ide_VCstrchr_loop_inv_3_established_goal5
theorem goal5 (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (a_1 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Cint.is_sint32 i) (fact4 : Memory.addr_lt a_1 a) (fact5 : Memory.addr_le a a_1) (fact6 : A_Strlen.p_valid_str t t_1 a) : ¬t_1 a_1 = Cint.to_sint8 i
  := sorry
end strchr_Why3_ide_VCstrchr_loop_inv_3_established_goal5
