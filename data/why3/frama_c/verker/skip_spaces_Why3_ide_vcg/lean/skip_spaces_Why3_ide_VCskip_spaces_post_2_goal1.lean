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
namespace skip_spaces_Why3_ide_VCskip_spaces_post_2_goal1
theorem goal1 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := t_1 a; Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Cint.is_sint8 x_1 → ¬A_Ctype.p_isspace x_1 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a (Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1)) → (∀(a_2 : Memory.addr), Memory.addr_lt a_2 a → Memory.addr_le a_1 a_2 → A_Ctype.p_isspace (t_1 a_2)) → x = Memory.addr.base a
  := sorry
end skip_spaces_Why3_ide_VCskip_spaces_post_2_goal1
