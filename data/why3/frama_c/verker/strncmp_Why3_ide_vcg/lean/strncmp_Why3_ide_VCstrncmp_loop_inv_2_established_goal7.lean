import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_loop_inv_2_established_goal7
theorem goal7 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := A_Strnlen.l_strnlen t_1 a_1 i; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strnlen.p_valid_strn t t_1 a i → A_Strnlen.p_valid_strn t t_1 a_1 i → (∀(i_1 : ℤ), let x_1 : ℤ := t_1 (Memory.shift a_1 i_1); let x_2 : ℤ := t_1 (Memory.shift a i_1); (0 : ℤ) ≤ i_1 → i_1 < x → (Cint.to_uint8 x_1 = Cint.to_uint8 x_2) = (x_1 = x_2)) → Memory.addr_le a_1 a_1 ∧ Memory.addr_le a_1 (Memory.shift a_1 x)
  := sorry
end strncmp_Why3_ide_VCstrncmp_loop_inv_2_established_goal7
