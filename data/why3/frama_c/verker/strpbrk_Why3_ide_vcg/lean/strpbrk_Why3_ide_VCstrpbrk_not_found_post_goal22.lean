import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_StrPBrk.A_StrPBrk
import frama_c.verker.lib.lean.A_StrSpn.A_StrSpn
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strpbrk_Why3_ide_VCstrpbrk_not_found_post_goal22
theorem goal22 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := t_1 a_1; let a_4 : Memory.addr := Memory.shift a_3 (A_Strlen.l_strlen t_1 a_3); let a_5 : Memory.addr := Memory.shift a_2 (A_Strlen.l_strlen t_1 a_2); ¬x = (0 : ℤ) → ¬x_1 = (0 : ℤ) → x_1 = x → A_StrPBrk.l_strpbrk a_3 a_2 = A_StrPBrk.l_strpbrk a a_2 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_2 a_1 → Memory.addr_le a_3 a → Cint.is_sint8 x → Cint.is_sint8 x_1 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Memory.addr_lt a a_4 → Memory.addr_lt a_1 a_5 → Memory.addr_le a a_4 → Memory.addr_le a_1 a_5 → (A_StrSpn.p_in_array t_1 a_2 x → A_StrSpn.p_in_array t_1 a_1 x) → (∀(a_6 : Memory.addr), Memory.addr_lt a_6 a_1 → Memory.addr_le a_2 a_6 → ¬x = t_1 a_6) → (∀(a_7 : Memory.addr) (a_6 : Memory.addr), Memory.addr_lt a_7 a → Memory.addr_le a_2 a_6 → Memory.addr_le a_3 a_7 → Memory.addr_lt a_6 a_5 → ¬t_1 a_7 = t_1 a_6) → (∀(a_7 : Memory.addr) (a_6 : Memory.addr), Memory.addr_le a_2 a_6 → Memory.addr_le a_3 a_7 → Memory.addr_lt a_6 a_5 → Memory.addr_lt a_7 a_4 → ¬t_1 a_7 = t_1 a_6) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a
  := sorry
end strpbrk_Why3_ide_VCstrpbrk_not_found_post_goal22
