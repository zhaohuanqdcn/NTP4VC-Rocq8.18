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
namespace strim_Why3_ide_VCstrim_assert_8_goal10
theorem goal10 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_3 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a; let a_2 : Memory.addr := Memory.shift a (x - (1 : ℤ)); let x_1 : ℤ := t_1 a_2; let x_2 : ℤ := t_2 a_1; let a_3 : Memory.addr := Memory.shift a (-(1 : ℤ)); let m : Memory.addr -> ℤ := Function.update t_3 (Memory.shift a (0 : ℤ)) (0 : ℤ); ¬x = (0 : ℤ) → t_1 (Memory.shift a x) = (0 : ℤ) → ¬x_1 = (0 : ℤ) → (0 : ℤ) < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint8 x_2 → A_Strlen.p_valid_str t t_1 a → Cint.is_uint64 x → Memory.addr_le a_3 a_3 → Cint.is_sint8 (t_3 a_3) → Memory.addr_le a_3 a_2 → Cint.is_sint8 x_1 → (if Memory.addr_le a a_3 then t_2 = t_1 ∧ a_3 = a_1 ∧ ¬A_Ctype.p_isspace x_2 else t_3 = t_1) → (Memory.addr_lt a a_3 → A_Strlen.l_strlen m a_3 = (1 : ℤ)) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x → ¬t_1 (Memory.shift a i) = (0 : ℤ)) → (∀(a_4 : Memory.addr), Memory.addr_lt a_3 a_4 → Memory.addr_le a_4 a_2 → A_Ctype.p_isspace (t_1 a_4)) → A_Strlen.l_strlen m a = (0 : ℤ)
  := sorry
end strim_Why3_ide_VCstrim_assert_8_goal10
