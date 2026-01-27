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
namespace strchrnul_Why3_ide_VCstrchrnul_post_2_goal1
theorem goal1 (i : ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Cint.to_sint8 i; let a_2 : Memory.addr := A_Strchrnul.l_strchrnul t_1 a_1 x; let x_1 : ℤ := t_1 a; let x_2 : ℤ := A_Strlen.l_strlen t_1 a_1; a_2 = A_Strchrnul.l_strchrnul t_1 a x → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_1 a → Cint.is_sint8 x_1 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a (Memory.shift a_1 x_2) → (x_1 = (0 : ℤ) → Memory.addr.offset a_1 + x_2 = Memory.addr.offset a) → x_1 = (0 : ℤ) ∨ x_1 = x → (∀(a_3 : Memory.addr), Memory.addr_lt a_3 a → Memory.addr_le a_1 a_3 → ¬t_1 a_3 = x) → a_2 = a
  := sorry
end strchrnul_Why3_ide_VCstrchrnul_post_2_goal1
