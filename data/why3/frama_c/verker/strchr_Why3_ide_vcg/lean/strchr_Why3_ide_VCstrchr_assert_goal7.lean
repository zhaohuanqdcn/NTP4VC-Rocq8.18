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
namespace strchr_Why3_ide_VCstrchr_assert_goal7
theorem goal7 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let a_2 : Memory.addr := Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1); x = Cint.to_sint8 i → A_Strchr.l_strchr t_1 a_1 x = A_Strchr.l_strchr t_1 a x → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_1 a → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a a_2 → (∀(a_3 : Memory.addr), Memory.addr_lt a_3 a → Memory.addr_le a_1 a_3 → ¬x = t_1 a_3) → Memory.addr_lt a a_2 = (¬x = (0 : ℤ))
  := sorry
end strchr_Why3_ide_VCstrchr_assert_goal7
