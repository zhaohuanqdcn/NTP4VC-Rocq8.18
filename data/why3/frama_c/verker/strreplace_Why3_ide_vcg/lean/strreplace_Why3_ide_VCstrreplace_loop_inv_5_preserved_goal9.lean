import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strreplace_Why3_ide_VCstrreplace_loop_inv_5_preserved_goal9
theorem goal9 (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_3 : Memory.addr -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_2 a_1; let a_3 : Memory.addr := Memory.shift a_1 x; let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 (Memory.shift a_1 (0 : ℤ)) x; let a_5 : ℤ := a_4 a; let x_1 : ℤ := t_2 a_2; t_2 a_3 = (0 : ℤ) → ¬a_5 = (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint8 i → Memory.addr_le a_1 a → Memory.addr_le a_1 a_2 → Cint.is_sint8 x_1 → A_Strlen.p_valid_str t t_2 a_1 → Cint.is_uint64 x → Memory.addr_lt a_2 (Memory.shift a (1 : ℤ)) → Memory.addr_le a a_3 → Cint.is_sint8 a_5 → A_Strlen.p_valid_str t a_4 a → A_Strlen.p_valid_str t a_4 a_1 → (if a_5 = x_1 then Function.update a_4 a i = t_3 else a_4 = t_3) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → ¬t_2 (Memory.shift a_1 i_1) = (0 : ℤ)) → (∀(a_6 : Memory.addr), Memory.addr_le a a_6 → Memory.addr_lt a_6 a_3 → a_4 a_6 = t_2 a_6) → (∀(a_6 : Memory.addr), x_1 = t_2 a_6 → Memory.addr_lt a_6 a → Memory.addr_le a_1 a_6 → a_4 a_6 = i) → (∀(a_6 : Memory.addr), let x_2 : ℤ := t_2 a_6; ¬x_1 = x_2 → Memory.addr_lt a_6 a → Memory.addr_le a_1 a_6 → a_4 a_6 = x_2) → t_3 a_2 = i
  := sorry
end strreplace_Why3_ide_VCstrreplace_loop_inv_5_preserved_goal9
