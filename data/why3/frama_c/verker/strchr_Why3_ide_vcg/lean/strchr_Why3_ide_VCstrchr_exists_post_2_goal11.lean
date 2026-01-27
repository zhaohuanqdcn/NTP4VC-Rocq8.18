import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strchr.A_Strchr
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strchr_Why3_ide_VCstrchr_exists_post_2_goal11
theorem goal11 (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 a_3; let x_1 : ℤ := t_1 a; let x_2 : ℤ := t_1 a_1; let a_4 : Memory.addr := Memory.shift a_2 (A_Strlen.l_strlen t_1 a_2); x = Cint.to_sint8 i → A_Strchr.l_strchr t_1 a_2 x = A_Strchr.l_strchr t_1 a_1 x → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_2 a_1 → Memory.addr_le a_2 a_3 → Cint.is_sint8 x_1 → Cint.is_sint8 x_2 → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → Memory.addr_le a_1 a_4 → Memory.addr_le a_3 a_4 → (if x = x_2 then a_1 = a ∧ (a_4 = a) = (x_1 = (0 : ℤ)) ∧ Memory.addr_lt a a_4 = (¬x_1 = (0 : ℤ)) else Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∧ x_2 = (0 : ℤ)) → (∀(a_5 : Memory.addr), Memory.addr_lt a_5 a_1 → Memory.addr_le a_2 a_5 → ¬x = t_1 a_5) → x = x_1
  := sorry
end strchr_Why3_ide_VCstrchr_exists_post_2_goal11
