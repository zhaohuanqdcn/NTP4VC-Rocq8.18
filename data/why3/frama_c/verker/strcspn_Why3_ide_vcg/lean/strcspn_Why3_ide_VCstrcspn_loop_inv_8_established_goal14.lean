import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_StrCSpn.A_StrCSpn
import frama_c.verker.lib.lean.A_StrSpn.A_StrSpn
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcspn_Why3_ide_VCstrcspn_loop_inv_8_established_goal14
theorem goal14 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) (a_3 : Memory.addr) : let x : ℤ := t_1 a_2; let x_1 : ℤ := Memory.addr.offset a_2; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := A_Strlen.l_strlen t_1 a_1; ¬x = (0 : ℤ) → x_1 + A_StrCSpn.l_strcspn a_2 a = x_2 + A_StrCSpn.l_strcspn a_1 a → x_2 ≤ x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_1 ≤ x_2 + x_3 → Memory.linked t → Memory.sconst t_1 → Memory.addr_lt a_3 a → Memory.addr_le a a_3 → Memory.addr_le a_1 a_2 → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → Cint.is_uint64 (x_1 - x_2) → Memory.addr_le a_2 (Memory.shift a_1 x_3) → (∀(a_5 : Memory.addr) (a_4 : Memory.addr), Memory.addr_lt a_5 a_2 → Memory.addr_le a a_4 → Memory.addr_le a_1 a_5 → Memory.addr_lt a_4 (Memory.shift a (A_Strlen.l_strlen t_1 a)) → ¬t_1 a_5 = t_1 a_4) → ¬t_1 a_3 = x
  := sorry
end strcspn_Why3_ide_VCstrcspn_loop_inv_8_established_goal14
