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
namespace strcspn_Why3_ide_VCstrcspn_loop_inv_3_preserved_goal6
theorem goal6 (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a_3; let x_1 : ℤ := Memory.addr.offset a_3; let x_2 : ℤ := Memory.addr.offset a; let x_3 : ℤ := A_Strlen.l_strlen t_1 a; let a_4 : Memory.addr := Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1); t_1 a_2 = (0 : ℤ) → ¬x = (0 : ℤ) → x_1 + A_StrCSpn.l_strcspn a_3 a_1 = x_2 + A_StrCSpn.l_strcspn a a_1 → x_2 ≤ x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_1 ≤ x_2 + x_3 → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a a_3 → Memory.addr_le a_1 a_2 → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → ¬A_StrSpn.p_in_array t_1 a_1 x → Cint.is_uint64 (x_1 - x_2) → Memory.addr_le a_2 a_4 → Memory.addr_le a_3 (Memory.shift a x_3) → (∀(a_5 : Memory.addr), Memory.addr_lt a_5 a_2 → Memory.addr_le a_1 a_5 → ¬x = t_1 a_5) → (∀(a_6 : Memory.addr) (a_5 : Memory.addr), Memory.addr_lt a_6 a_3 → Memory.addr_le a a_6 → Memory.addr_le a_1 a_5 → Memory.addr_lt a_5 a_4 → ¬t_1 a_6 = t_1 a_5) → x_2 + Cint.to_uint64 ((1 : ℤ) + x_1 - x_2) = (1 : ℤ) + x_1
  := sorry
end strcspn_Why3_ide_VCstrcspn_loop_inv_3_preserved_goal6
