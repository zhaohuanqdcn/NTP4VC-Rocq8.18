import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_StrSpn.A_StrSpn
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strspn_Why3_ide_VCstrspn_post_2_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (a_5 : Memory.addr) (a_4 : Memory.addr) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := Memory.addr.offset a; let x_2 : ℤ := A_Strlen.l_strlen t_1 a; let x_3 : ℤ := t_1 a_1; let x_4 : ℤ := t_1 a_2; let a_6 : Memory.addr := Memory.shift a_3 (A_Strlen.l_strlen t_1 a_3); let x_5 : ℤ := i + x_1; x + A_StrSpn.l_strspn a_1 a_3 = x_1 + A_StrSpn.l_strspn a a_3 → x_1 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → x ≤ x_1 + x_2 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → Memory.addr_le a a_1 → Memory.addr_le a_3 a_5 → Cint.is_sint8 x_3 → Cint.is_sint8 x_4 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_3 → Cint.is_uint64 (x - x_1) → Memory.addr_lt a_5 a_6 → Memory.addr_le a_1 (Memory.shift a x_2) → (if x_3 = (0 : ℤ) then x_5 = x else a_2 = a_1 ∧ t_1 a_4 = (0 : ℤ) ∧ x_5 = Memory.addr.offset a_2 ∧ Memory.addr_le a_3 a_4 ∧ A_Strlen.p_valid_str t t_1 a_4 ∧ ¬A_StrSpn.p_in_array t_1 a_3 x_4 ∧ Memory.addr_le a_4 a_6 ∧ (∀(a_7 : Memory.addr), Memory.addr_lt a_7 a_4 → Memory.addr_le a_3 a_7 → ¬x_4 = t_1 a_7)) → (∀(a_7 : Memory.addr), Memory.addr_lt a_7 a_1 → Memory.addr_le a a_7 → (∃(a_8 : Memory.addr), t_1 a_7 = t_1 a_8 ∧ Memory.addr_le a_3 a_8 ∧ Memory.addr_lt a_8 a_6)) → ¬t_1 (Memory.shift a i) = t_1 a_5
  := sorry
end strspn_Why3_ide_VCstrspn_post_2_goal0
