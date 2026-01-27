import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_StrPBrk.A_StrPBrk
import frama_c.verker.lib.lean.A_StrSpn.A_StrSpn
open Classical
open Lean4Why3
namespace strsep_Why3_ide_VCstrsep_input_strpbrk_not_null_post_4_goal2
theorem goal2 (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_4 : Memory.addr) (t : ℤ -> ℤ) : let a_5 : Memory.addr := t_2 a; let a_6 : Memory.addr := A_StrPBrk.l_strpbrk a_5 a_1; let a_7 : Memory.addr := Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1); let a_8 : Memory.addr := Memory.shift a_5 (A_Strlen.l_strlen t_1 a_5); ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_1 a_3 = t_1 a_2 → ¬a_6 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_1 a_6 = t_1 a_4 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a_2 → Memory.addr_le a_1 a_4 → Memory.valid_rw t a (1 : ℤ) → Memory.addr_le a_5 a_3 → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_5 → Memory.addr_le a_5 a_6 → Memory.addr_lt a_2 a_7 → Memory.addr_le a_4 a_7 → Memory.addr_lt a_3 a_8 → Memory.addr_lt a_6 a_8 → (∀(a_10 : Memory.addr) (a_9 : Memory.addr), Memory.addr_le a_1 a_9 → Memory.addr_le a_5 a_10 → Memory.addr_lt a_10 a_6 → Memory.addr_lt a_9 a_7 → ¬t_1 a_10 = t_1 a_9) → A_Strlen.p_valid_str t (Function.update t_1 a_6 (0 : ℤ)) a_5
  := sorry
end strsep_Why3_ide_VCstrsep_input_strpbrk_not_null_post_4_goal2
