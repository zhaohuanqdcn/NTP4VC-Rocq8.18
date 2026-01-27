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
namespace strpbrk_Why3_ide_VCstrpbrk_loop_term_2_positive_goal18
theorem goal18 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (a_3 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := t_1 a_1; let x_2 : ℤ := A_Strlen.l_strlen t_1 a_2; let a_4 : Memory.addr := Memory.shift a_2 x_2; ¬x = (0 : ℤ) → ¬x_1 = (0 : ℤ) → ¬x_1 = x → A_StrPBrk.l_strpbrk a_3 a_2 = A_StrPBrk.l_strpbrk a_1 a_2 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_2 a → Memory.addr_le a_3 a_1 → Cint.is_sint8 x → Cint.is_sint8 x_1 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Memory.addr_le a a_4 → Memory.addr_le a_1 (Memory.shift a_3 (A_Strlen.l_strlen t_1 a_3)) → (A_StrSpn.p_in_array t_1 a_2 x_1 → A_StrSpn.p_in_array t_1 a x_1) → (∀(a_5 : Memory.addr), Memory.addr_lt a_5 a → Memory.addr_le a_2 a_5 → ¬x_1 = t_1 a_5) → (∀(a_6 : Memory.addr) (a_5 : Memory.addr), Memory.addr_lt a_6 a_1 → Memory.addr_le a_2 a_5 → Memory.addr_le a_3 a_6 → Memory.addr_lt a_5 a_4 → ¬t_1 a_6 = t_1 a_5) → Memory.addr.offset a ≤ Memory.addr.offset a_2 + x_2
  := sorry
end strpbrk_Why3_ide_VCstrpbrk_loop_term_2_positive_goal18
