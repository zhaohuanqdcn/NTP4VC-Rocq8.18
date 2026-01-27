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
namespace skip_spaces_Why3_ide_VCskip_spaces_assign_exit_part2_goal12
theorem goal12 (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Memory.addr_le a_1 a) (fact4 : Cint.is_sint8 (t_1 a)) (fact5 : A_Strlen.p_valid_str t t_1 a) (fact6 : A_Strlen.p_valid_str t t_1 a_1) (fact7 : Memory.addr_le a (Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1))) : ¬(∀(a_2 : Memory.addr), Memory.addr_lt a_2 a → Memory.addr_le a_1 a_2 → A_Ctype.p_isspace (t_1 a_2))
  := sorry
end skip_spaces_Why3_ide_VCskip_spaces_assign_exit_part2_goal12
