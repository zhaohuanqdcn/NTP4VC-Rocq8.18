import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strlen_Why3_ide_VCstrlen_post_3_goal2
theorem goal2 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := A_Strlen.l_strlen t_1 a_1; let x_2 : ℤ := Memory.addr.offset a; let x_3 : ℤ := Cint.to_uint64 (x_2 - x); t_1 a = (0 : ℤ) → x + x_1 = x_2 + A_Strlen.l_strlen t_1 a → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i < x_3 → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a (Memory.shift a_1 x_1) → Cint.is_sint8 (t_1 (Memory.shift a_1 x_3)) → ¬t_1 (Memory.shift a_1 i) = (0 : ℤ)
  := sorry
end strlen_Why3_ide_VCstrlen_post_3_goal2
