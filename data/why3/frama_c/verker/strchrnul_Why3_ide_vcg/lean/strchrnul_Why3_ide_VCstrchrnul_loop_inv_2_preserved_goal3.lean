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
namespace strchrnul_Why3_ide_VCstrchrnul_loop_inv_2_preserved_goal3
theorem goal3 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Cint.to_sint8 i; let a_2 : Memory.addr := Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1); let a_3 : Memory.addr := Memory.shift a (1 : ℤ); ¬x = (0 : ℤ) → ¬x = x_1 → A_Strchrnul.l_strchrnul t_1 a_1 x_1 = A_Strchrnul.l_strchrnul t_1 a x_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_1 a → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a a_2 → (∀(a_4 : Memory.addr), Memory.addr_lt a_4 a → Memory.addr_le a_1 a_4 → ¬t_1 a_4 = x_1) → Memory.addr_le a_1 a_3 ∧ Memory.addr_le a_3 a_2
  := sorry
end strchrnul_Why3_ide_VCstrchrnul_loop_inv_2_preserved_goal3
