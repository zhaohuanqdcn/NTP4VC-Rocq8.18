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
namespace strim_Why3_ide_VCstrim_assert_10_goal12
theorem goal12 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t_3 : Memory.addr -> ℤ) (a_2 : Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (t_1 : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_2 a; let a_3 : Memory.addr := Memory.shift a (x - (1 : ℤ)); let x_1 : ℤ := t_2 a_3; let x_2 : ℤ := t_3 a_2; let a_4 : Memory.addr := Memory.shift a (-(1 : ℤ)); let a_5 : Memory.addr := Memory.shift a_2 (1 : ℤ); let m : Memory.addr -> ℤ := Function.update t_3 a_5 (0 : ℤ); ¬x = (0 : ℤ) → t_2 (Memory.shift a x) = (0 : ℤ) → ¬x_1 = (0 : ℤ) → (0 : ℤ) < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint8 x_2 → A_Strlen.p_valid_str t t_2 a → Cint.is_uint64 x → Memory.addr_le a_4 a_2 → Memory.addr_le a_2 a_3 → Cint.is_sint8 x_1 → (if Memory.addr_le a a_2 then a_3 = a_1 ∧ ¬A_Ctype.p_isspace (t_2 a_2) ∧ (a_4 = a_2 ∨ ¬A_Ctype.p_isspace x_2) else t_3 = t_2 ∧ t_1 = t ∧ Memory.shift a (A_Strlen.l_strlen t_3 a - (1 : ℤ)) = a_1 ∧ (a_4 = a_2 ∨ ¬A_Ctype.p_isspace x_2)) → (a_4 = a_2 → A_Strlen.l_strlen m a = (0 : ℤ)) → (Memory.addr_lt a a_2 → A_Strlen.l_strlen m a_2 = (1 : ℤ)) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x → ¬t_2 (Memory.shift a i) = (0 : ℤ)) → (∀(a_6 : Memory.addr), Memory.addr_le a_6 a_1 → Memory.addr_lt a_5 a_6 → A_Ctype.p_isspace (m a_6)) → (∀(a_6 : Memory.addr), Memory.addr_lt a_2 a_6 → Memory.addr_le a_6 a_3 → A_Ctype.p_isspace (t_2 a_6)) → A_Strlen.p_valid_str t_1 m a
  := sorry
end strim_Why3_ide_VCstrim_assert_10_goal12
