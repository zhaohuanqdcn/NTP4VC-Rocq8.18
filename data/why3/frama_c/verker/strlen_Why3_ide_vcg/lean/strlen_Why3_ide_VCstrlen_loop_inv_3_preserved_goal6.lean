import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strlen_Why3_ide_VCstrlen_loop_inv_3_preserved_goal6
theorem goal6 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := A_Strlen.l_strlen t_1 a_1; let x_2 : ℤ := Memory.addr.offset a_1 + x_1; let x_3 : ℤ := Memory.addr.offset a; ¬x = (0 : ℤ) → x_2 = x_3 + A_Strlen.l_strlen t_1 a → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a (Memory.shift a_1 x_1) → (1 : ℤ) + x_3 + A_Strlen.l_strlen t_1 (Memory.shift a (1 : ℤ)) = x_2
  := sorry
end strlen_Why3_ide_VCstrlen_loop_inv_3_preserved_goal6
