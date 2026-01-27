import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace skip_spaces_Why3_ide_VCskip_spaces_loop_inv_3_established_goal10
theorem goal10 (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Memory.addr_lt a_1 a) (fact4 : Memory.addr_le a a_1) (fact5 : A_Strlen.p_valid_str t t_1 a) : A_Ctype.p_isspace (t_1 a_1)
  := sorry
end skip_spaces_Why3_ide_VCskip_spaces_loop_inv_3_established_goal10
