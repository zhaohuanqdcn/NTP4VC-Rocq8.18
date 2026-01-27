import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strrchr_Why3_ide_VCstrrchr_found_post_3_goal16
theorem goal16 (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (a_2 : Memory.addr) (a_4 : Memory.addr) : let x : ℤ := t_1 a_3; let x_1 : ℤ := A_Strlen.l_strlen t_1 a_1; let a_5 : Memory.addr := Memory.shift a_1 x_1; let x_2 : ℤ := t_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ)); t_1 a = (0 : ℤ) → x = Cint.to_sint8 i → t_1 a_5 = (0 : ℤ) → Memory.shift a_1 ((1 : ℤ) + x_1) = Memory.shift a (1 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_lt a_2 a_4 → Memory.addr_le a_1 a → Memory.addr_le a_1 a_3 → Cint.is_sint8 (t_1 a_2) → Cint.is_sint8 x_2 → A_Strlen.p_valid_str t t_1 a_1 → Memory.addr_le a a_5 → Memory.addr_le a_3 a_5 → Memory.addr_le a_4 a_5 → (if x = (0 : ℤ) then a_2 = a else Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2) → ((∃(a_6 : Memory.addr), x = t_1 a_6 ∧ Memory.addr_le a_1 a_6 ∧ Memory.addr_lt a_6 a_5) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2) → ¬x_2 = x ∨ ¬Memory.addr_lt (Memory.addr.mk (0 : ℤ) (0 : ℤ)) a ∨ ¬Memory.addr_le a_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ)) → (∀(a_6 : Memory.addr), Memory.addr_lt a_6 a → Memory.addr_le a_1 a_6 → ¬x = t_1 a_6) → ¬t_1 a_4 = x
  := sorry
end strrchr_Why3_ide_VCstrrchr_found_post_3_goal16
