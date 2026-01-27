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
namespace skip_spaces_Why3_ide_VCskip_spaces_post_6_goal5
theorem goal5 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (t_1 : ℤ -> ℤ) : let x : ℤ := t_2 a; Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Memory.addr_le a_1 a → Cint.is_sint8 x → Cint.is_sint8 (t_3 a) → ¬A_Ctype.p_isspace x → A_Strlen.p_valid_str t t_2 a → A_Strlen.p_valid_str t t_2 a_1 → Memory.addr_le a (Memory.shift a_1 (A_Strlen.l_strlen t_2 a_1)) → (∀(a_2 : Memory.addr), Memory.addr_lt a_2 a → Memory.addr_le a_1 a_2 → A_Ctype.p_isspace (t_2 a_2)) → A_Strlen.p_valid_str t_1 t_3 a
  := sorry
end skip_spaces_Why3_ide_VCskip_spaces_post_6_goal5
