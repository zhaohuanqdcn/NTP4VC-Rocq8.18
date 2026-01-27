import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace strim_Why3_ide_VCstrim_loop_inv_2_preserved_goal6
theorem goal6 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (a_2 : Memory.addr) (t_2 : Memory.addr -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a; let a_3 : Memory.addr := Memory.shift a (x - (1 : ℤ)); let x_1 : ℤ := t_1 a_3; let x_2 : ℤ := t_1 a_1; ¬i = (0 : ℤ) → ¬x = (0 : ℤ) → t_1 (Memory.shift a x) = (0 : ℤ) → ¬x_1 = (0 : ℤ) → (0 : ℤ) < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint8 i → Memory.addr_le a a_1 → Cint.is_sint8 x_2 → A_Ctype.p_isspace x_2 → A_Strlen.p_valid_str t t_1 a → Cint.is_uint64 x → Memory.addr_lt (Memory.shift a_1 (-(1 : ℤ))) a_2 → Memory.addr_le (Memory.shift a (-(1 : ℤ))) a_1 → Memory.addr_le a_1 a_3 → Memory.addr_le a_2 a_3 → Cint.is_sint8 x_1 → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → ¬t_1 (Memory.shift a i_1) = (0 : ℤ)) → (∀(a_4 : Memory.addr), Memory.addr_lt a_1 a_4 → Memory.addr_le a_4 a_3 → A_Ctype.p_isspace (t_1 a_4)) → A_Ctype.p_isspace (t_2 a_2)
  := sorry
end strim_Why3_ide_VCstrim_loop_inv_2_preserved_goal6
