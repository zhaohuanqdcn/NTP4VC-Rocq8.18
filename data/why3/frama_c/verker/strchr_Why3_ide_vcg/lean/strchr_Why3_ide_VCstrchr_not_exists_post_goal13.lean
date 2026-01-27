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
namespace strchr_Why3_ide_VCstrchr_not_exists_post_goal13
theorem goal13 (i : ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) : let x : ℤ := Cint.to_sint8 i; let x_1 : ℤ := t_1 a_1; let a_3 : Memory.addr := Memory.shift a_2 (A_Strlen.l_strlen t_1 a_2); let a_4 : Memory.addr := Memory.shift a_2 (A_Strlen.l_strlen t_2 a_2); let x_2 : ℤ := t_2 a; A_Strchr.l_strchr t_1 a_2 x = A_Strchr.l_strchr t_1 a_1 x → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_2 a_1 → Cint.is_sint8 x_1 → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → Memory.addr_le a_1 a_3 → (if x_1 = x then a_1 = a ∧ t_2 = t_1 ∧ (a_4 = a) = (x_2 = (0 : ℤ)) ∧ Memory.addr_lt a a_4 = (¬x_2 = (0 : ℤ)) else t_3 = t_1 ∧ Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∧ t_3 a_1 = (0 : ℤ)) → (∀(a_5 : Memory.addr), Memory.addr_lt a_5 a_1 → Memory.addr_le a_2 a_5 → ¬t_1 a_5 = x) → (∀(a_5 : Memory.addr), Memory.addr_le a_2 a_5 → Memory.addr_le a_5 a_3 → ¬t_1 a_5 = x) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a
  := sorry
end strchr_Why3_ide_VCstrchr_not_exists_post_goal13
