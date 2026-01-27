import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strlen_Why3_ide_VCstrlen_loop_inv_2_preserved_goal5
theorem goal5 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := A_Strlen.l_strlen t_1 a_1; ¬x = (0 : ℤ) → Memory.addr.offset a_1 + x_1 = Memory.addr.offset a + A_Strlen.l_strlen t_1 a → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a (Memory.shift a_1 x_1) → A_Strlen.p_valid_str t t_1 (Memory.shift a (1 : ℤ))
  := sorry
end strlen_Why3_ide_VCstrlen_loop_inv_2_preserved_goal5
