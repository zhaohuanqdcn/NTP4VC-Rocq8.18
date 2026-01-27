import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strchrnul.A_Strchrnul
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strchrnul_Why3_ide_VCstrchrnul_loop_inv_3_preserved_goal5
theorem goal5 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (a_2 : Memory.addr) : let x : ℤ := t_1 a; let x_1 : ℤ := Cint.to_sint8 i; ¬x = (0 : ℤ) → ¬x = x_1 → A_Strchrnul.l_strchrnul t_1 a_1 x_1 = A_Strchrnul.l_strchrnul t_1 a x_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_1 a → Memory.addr_le a_1 a_2 → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_lt a_2 (Memory.shift a (1 : ℤ)) → Memory.addr_le a (Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1)) → (∀(a_3 : Memory.addr), Memory.addr_lt a_3 a → Memory.addr_le a_1 a_3 → ¬t_1 a_3 = x_1) → ¬t_1 a_2 = x_1
  := sorry
end strchrnul_Why3_ide_VCstrchrnul_loop_inv_3_preserved_goal5
