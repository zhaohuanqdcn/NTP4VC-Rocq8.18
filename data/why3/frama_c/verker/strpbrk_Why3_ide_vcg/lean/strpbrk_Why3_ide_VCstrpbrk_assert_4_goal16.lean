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
namespace strpbrk_Why3_ide_VCstrpbrk_assert_4_goal16
theorem goal16 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (a_3 : Memory.addr) (t : ℤ -> ℤ) (a_4 : Memory.addr) (a_5 : Memory.addr) : let x : ℤ := t_1 a_1; let a_6 : Memory.addr := Memory.shift a_2 (A_Strlen.l_strlen t_1 a_2); t_1 a = (0 : ℤ) → ¬x = (0 : ℤ) → A_StrPBrk.l_strpbrk a_3 a_2 = A_StrPBrk.l_strpbrk a_1 a_2 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_2 a → Memory.addr_le a_2 a_4 → Memory.addr_le a_3 a_1 → Memory.addr_le a_3 a_5 → Memory.addr_le a_5 a_1 → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Memory.addr_lt a_4 a_6 → Memory.addr_le a a_6 → Memory.addr_le a_1 (Memory.shift a_3 (A_Strlen.l_strlen t_1 a_3)) → (A_StrSpn.p_in_array t_1 a_2 x → A_StrSpn.p_in_array t_1 a x) → (∀(a_7 : Memory.addr), Memory.addr_lt a_7 a → Memory.addr_le a_2 a_7 → ¬x = t_1 a_7) → (∀(a_7 : Memory.addr), Memory.addr_le a_2 a_7 → Memory.addr_lt a_7 a_6 → ¬x = t_1 a_7) → (∀(a_8 : Memory.addr) (a_7 : Memory.addr), Memory.addr_lt a_8 a_1 → Memory.addr_le a_2 a_7 → Memory.addr_le a_3 a_8 → Memory.addr_lt a_7 a_6 → ¬t_1 a_8 = t_1 a_7) → ¬t_1 a_5 = t_1 a_4
  := sorry
end strpbrk_Why3_ide_VCstrpbrk_assert_4_goal16
