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
namespace strpbrk_Why3_ide_VCstrpbrk_loop_inv_5_established_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let a_3 : Memory.addr := Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1); ¬x = (0 : ℤ) → A_StrPBrk.l_strpbrk a_2 a_1 = A_StrPBrk.l_strpbrk a a_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_2 a → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → Memory.addr_le a (Memory.shift a_2 (A_Strlen.l_strlen t_1 a_2)) → (∀(a_5 : Memory.addr) (a_4 : Memory.addr), Memory.addr_lt a_5 a → Memory.addr_le a_1 a_4 → Memory.addr_le a_2 a_5 → Memory.addr_lt a_4 a_3 → ¬t_1 a_5 = t_1 a_4) → Memory.addr_le a_1 a_1 ∧ Memory.addr_le a_1 a_3
  := sorry
end strpbrk_Why3_ide_VCstrpbrk_loop_inv_5_established_goal8
