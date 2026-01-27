import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
import frama_c.verker.lib.lean.A_SkipSpaces.A_SkipSpaces
open Classical
open Lean4Why3
namespace strim_Why3_ide_VCstrim_len_post_5_goal17
theorem goal17 (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : ℤ -> ℤ) : let a_2 : Memory.addr := A_SkipSpaces.l_skip_spaces a; let x : ℤ := Memory.addr.base a; let x_1 : ℤ := A_Strlen.l_strlen t_2 a; let a_3 : Memory.addr := Memory.shift a (x_1 - (1 : ℤ)); let x_2 : ℤ := t_2 a_3; let x_3 : ℤ := t_3 a_1; let a_4 : Memory.addr := Memory.shift a (-(1 : ℤ)); let a_5 : Memory.addr := Memory.shift a_1 (1 : ℤ); let m : Memory.addr -> ℤ := Function.update t_3 a_5 (0 : ℤ); let x_4 : ℤ := m a_2; let x_5 : ℤ := A_Strlen.l_strlen m a; let x_6 : ℤ := m (Memory.shift a_2 (A_Strlen.l_strlen m a_2 - (1 : ℤ))); Memory.addr.base a_2 = x → t_2 (Memory.shift a x_1) = (0 : ℤ) → ¬x_2 = (0 : ℤ) → (0 : ℤ) < x_1 → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint8 x_3 → A_Strlen.p_valid_str t t_2 a → Memory.addr_le a a_2 → Cint.is_uint64 x_1 → Memory.addr_le a_4 a_1 → Cint.is_sint8 x_4 → ¬A_Ctype.p_isspace x_4 → A_Strlen.p_valid_str t_1 m a → A_Strlen.p_valid_str t_1 m a_2 → Memory.addr_le a_1 a_3 → Cint.is_sint8 x_2 → Memory.addr_le a_2 (Memory.shift a x_5) → Cint.is_sint8 x_6 → (if Memory.addr_le a a_1 then ¬A_Ctype.p_isspace (t_2 a_1) ∧ (a_4 = a_1 ∨ ¬A_Ctype.p_isspace x_3) else t_3 = t_2 ∧ t_1 = t ∧ (a_4 = a_1 ∨ ¬A_Ctype.p_isspace x_3)) → (a_4 = a_1 → x_5 = (0 : ℤ)) → (Memory.addr_lt a a_1 → A_Strlen.l_strlen m a_1 = (1 : ℤ)) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x_1 → ¬t_2 (Memory.shift a i) = (0 : ℤ)) → (∀(a_6 : Memory.addr), Memory.addr_le a a_6 → Memory.addr_lt a_6 a_2 → A_Ctype.p_isspace (m a_6)) → (∀(a_6 : Memory.addr), Memory.addr_lt a_1 a_6 → Memory.addr_le a_6 a_3 → A_Ctype.p_isspace (t_2 a_6)) → (∀(a_6 : Memory.addr), Memory.addr_lt a_5 a_6 → Memory.addr_le a_6 a_3 → A_Ctype.p_isspace (m a_6)) → ¬A_Ctype.p_isspace x_6
  := sorry
end strim_Why3_ide_VCstrim_len_post_5_goal17
