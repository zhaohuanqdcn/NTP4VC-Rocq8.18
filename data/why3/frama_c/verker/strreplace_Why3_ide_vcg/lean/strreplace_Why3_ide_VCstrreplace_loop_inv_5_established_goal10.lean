import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strreplace_Why3_ide_VCstrreplace_loop_inv_5_established_goal10
theorem goal10 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a; let x_1 : ℤ := t_1 a_1; t_1 (Memory.shift a x) = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint8 i → Memory.addr_lt a_1 a → Memory.addr_le a a_1 → Cint.is_sint8 x_1 → A_Strlen.p_valid_str t t_1 a → Cint.is_uint64 x → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → ¬t_1 (Memory.shift a i_1) = (0 : ℤ)) → x_1 = i
  := sorry
end strreplace_Why3_ide_VCstrreplace_loop_inv_5_established_goal10
