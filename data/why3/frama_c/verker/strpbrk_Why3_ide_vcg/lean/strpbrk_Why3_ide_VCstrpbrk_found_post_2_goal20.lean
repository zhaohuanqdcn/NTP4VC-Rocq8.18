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
namespace strpbrk_Why3_ide_VCstrpbrk_found_post_2_goal20
theorem goal20 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_4 : Memory.addr) (a_5 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (a_8 : Memory.addr) (a_7 : Memory.addr) (t : ℤ -> ℤ) (a_3 : Memory.addr) (a_6 : Memory.addr) : let x : ℤ := t_1 a_2; let a_9 : Memory.addr := Memory.shift a_4 (A_Strlen.l_strlen t_1 a_4); let a_10 : Memory.addr := Memory.shift a_5 (A_Strlen.l_strlen t_1 a_5); let x_1 : ℤ := t_1 a_1; let x_2 : ℤ := t_1 a; t_1 a_8 = t_1 a_7 → A_StrPBrk.l_strpbrk a_5 a_4 = A_StrPBrk.l_strpbrk a_2 a_4 → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_5) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_4 a_7 → Memory.addr_le a_5 a_2 → Memory.addr_le a_5 a_8 → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_4 → A_Strlen.p_valid_str t t_1 a_5 → Memory.addr_lt a_7 a_9 → Memory.addr_lt a_8 a_10 → Memory.addr_le a_2 a_10 → (if x = (0 : ℤ) then Memory.addr.mk (0 : ℤ) (0 : ℤ) = a else a_2 = a ∧ a_3 = a ∧ a_3 = a_2 ∧ a_6 = a_5 ∧ ¬x_1 = (0 : ℤ) ∧ x_1 = x_2 ∧ Memory.addr_le a_4 a_1 ∧ Memory.addr_le a_6 a ∧ A_Strlen.p_valid_str t t_1 a_1 ∧ Memory.addr_lt a (Memory.shift a_6 (A_Strlen.l_strlen t_1 a_6)) ∧ Memory.addr_lt a_1 a_9 ∧ Memory.addr_le a_1 a_9 ∧ (A_StrSpn.p_in_array t_1 a_4 x_2 → A_StrSpn.p_in_array t_1 a_1 x_2) ∧ (∀(a_11 : Memory.addr), Memory.addr_lt a_11 a_1 → Memory.addr_le a_4 a_11 → ¬x_2 = t_1 a_11) ∧ (∀(a_12 : Memory.addr) (a_11 : Memory.addr), Memory.addr_lt a_12 a → Memory.addr_le a_4 a_11 → Memory.addr_le a_6 a_12 → Memory.addr_lt a_11 a_9 → ¬t_1 a_12 = t_1 a_11)) → (∀(a_12 : Memory.addr) (a_11 : Memory.addr), Memory.addr_lt a_12 a_2 → Memory.addr_le a_4 a_11 → Memory.addr_le a_5 a_12 → Memory.addr_lt a_11 a_9 → ¬t_1 a_12 = t_1 a_11) → (∃(a_11 : Memory.addr), x_2 = t_1 a_11 ∧ Memory.addr_le a_4 a_11 ∧ Memory.addr_le a_11 a_9)
  := sorry
end strpbrk_Why3_ide_VCstrpbrk_found_post_2_goal20
