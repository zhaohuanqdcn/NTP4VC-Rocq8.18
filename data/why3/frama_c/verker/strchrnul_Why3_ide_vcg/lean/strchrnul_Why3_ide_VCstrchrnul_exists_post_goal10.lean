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
namespace strchrnul_Why3_ide_VCstrchrnul_exists_post_goal10
theorem goal10 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a_1 i); let x_1 : ℤ := A_Strlen.l_strlen t_1 a_1; t_1 a = (0 : ℤ) → x = Cint.to_sint8 i_1 → Memory.addr.offset a_1 + x_1 = Memory.addr.offset a → A_Strchrnul.l_strchrnul t_1 a_1 x = A_Strchrnul.l_strchrnul t_1 a x → (0 : ℤ) ≤ i → i < x_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_1 → Memory.addr_le a_1 a → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a (Memory.shift a_1 x_1) → (∀(a_2 : Memory.addr), Memory.addr_lt a_2 a → Memory.addr_le a_1 a_2 → ¬x = t_1 a_2) → x = (0 : ℤ)
  := sorry
end strchrnul_Why3_ide_VCstrchrnul_exists_post_goal10
