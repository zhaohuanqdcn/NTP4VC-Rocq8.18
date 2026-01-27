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
namespace skip_spaces_Why3_ide_VCskip_spaces_loop_inv_3_preserved_goal9
theorem goal9 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (a_2 : Memory.addr) (t_2 : Memory.addr -> ℤ) : let x : ℤ := t_1 a; ¬i = (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint8 i → Memory.addr_le a_1 a → Memory.addr_le a_1 a_2 → Cint.is_sint8 x → A_Ctype.p_isspace x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_lt a_2 (Memory.shift a (1 : ℤ)) → Memory.addr_le a (Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1)) → (∀(a_3 : Memory.addr), Memory.addr_lt a_3 a → Memory.addr_le a_1 a_3 → A_Ctype.p_isspace (t_1 a_3)) → A_Ctype.p_isspace (t_2 a_2)
  := sorry
end skip_spaces_Why3_ide_VCskip_spaces_loop_inv_3_preserved_goal9
