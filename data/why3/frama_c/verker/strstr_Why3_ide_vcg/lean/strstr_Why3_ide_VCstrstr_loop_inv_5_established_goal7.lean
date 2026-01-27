import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_StrStr.A_StrStr
open Classical
open Lean4Why3
namespace strstr_Why3_ide_VCstrstr_loop_inv_5_established_goal7
theorem goal7 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (a_2 : Memory.addr) : let x : ℤ := A_Strlen.l_strlen t_1 a; let x_1 : ℤ := A_Strlen.l_strlen t_1 a_1; ¬x = (0 : ℤ) → t_1 (Memory.shift a x) = (0 : ℤ) → t_1 (Memory.shift a_1 x_1) = (0 : ℤ) → (0 : ℤ) < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_lt a_2 a_1 → Memory.addr_le a_1 a_2 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Cint.is_uint64 x → Cint.is_uint64 x_1 → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x → ¬t_1 (Memory.shift a i) = (0 : ℤ)) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x_1 → ¬t_1 (Memory.shift a_1 i) = (0 : ℤ)) → ¬A_StrStr.p_strmatch t_1 a_2 a
  := sorry
end strstr_Why3_ide_VCstrstr_loop_inv_5_established_goal7
