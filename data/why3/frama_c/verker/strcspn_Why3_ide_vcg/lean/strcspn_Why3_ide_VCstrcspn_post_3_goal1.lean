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
namespace strcspn_Why3_ide_VCstrcspn_post_3_goal1
theorem goal1 (a_3 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (a_5 : Memory.addr) (a_6 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := Memory.addr.offset a_3; let x_1 : ℤ := Memory.addr.offset a_2; let x_2 : ℤ := A_Strlen.l_strlen t_1 a_2; let x_3 : ℤ := t_1 a_3; let x_4 : ℤ := t_1 a_4; let a_7 : Memory.addr := Memory.shift a (A_Strlen.l_strlen t_1 a); let x_5 : ℤ := t_1 a_1; x + A_StrCSpn.l_strcspn a_3 a = x_1 + A_StrCSpn.l_strcspn a_2 a → x_1 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x ≤ x_1 + x_2 → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a a_5 → Memory.addr_le a_2 a_3 → Memory.addr_le a_2 a_6 → Cint.is_sint8 x_3 → Cint.is_sint8 x_4 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Memory.addr_lt a_6 (Memory.shift a_2 i) → Cint.is_uint64 (x - x_1) → Memory.addr_lt a_5 a_7 → Memory.addr_le a_3 (Memory.shift a_2 x_2) → (if x_3 = (0 : ℤ) then i_1 = i ∧ i_1 + x_1 = x else a_4 = a_3 ∧ i_2 = i ∧ ¬x_5 = (0 : ℤ) ∧ x_4 = x_5 ∧ i_2 + x_1 = Memory.addr.offset a_4 ∧ Memory.addr_le a a_1 ∧ A_Strlen.p_valid_str t t_1 a_1 ∧ A_StrSpn.p_in_array t_1 a x_4 ∧ A_StrSpn.p_in_array t_1 a_1 x_4 ∧ Memory.addr_le a_1 a_7 ∧ (∀(a_8 : Memory.addr), Memory.addr_lt a_8 a_1 → Memory.addr_le a a_8 → ¬x_4 = t_1 a_8)) → (∀(a_9 : Memory.addr) (a_8 : Memory.addr), Memory.addr_lt a_9 a_3 → Memory.addr_le a a_8 → Memory.addr_le a_2 a_9 → Memory.addr_lt a_8 a_7 → ¬t_1 a_9 = t_1 a_8) → ¬t_1 a_6 = t_1 a_5
  := sorry
end strcspn_Why3_ide_VCstrcspn_post_3_goal1
