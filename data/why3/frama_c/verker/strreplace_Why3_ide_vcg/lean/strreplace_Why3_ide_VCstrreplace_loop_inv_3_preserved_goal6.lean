import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strreplace_Why3_ide_VCstrreplace_loop_inv_3_preserved_goal6
theorem goal6 (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := A_Strlen.l_strlen t_2 a_1; let a_2 : Memory.addr := Memory.shift a_1 x; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 (Memory.shift a_1 (0 : ℤ)) x; let a_4 : ℤ := a_3 a; let a_5 : Memory.addr := Memory.shift a (1 : ℤ); t_2 a_2 = (0 : ℤ) → ¬a_4 = (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint8 i → Cint.is_sint8 i_1 → Memory.addr_le a_1 a → A_Strlen.p_valid_str t t_2 a_1 → Cint.is_uint64 x → Memory.addr_le a a_2 → Cint.is_sint8 a_4 → A_Strlen.p_valid_str t a_3 a → A_Strlen.p_valid_str t a_3 a_1 → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < x → ¬t_2 (Memory.shift a_1 i_2) = (0 : ℤ)) → (∀(a_6 : Memory.addr), Memory.addr_le a a_6 → Memory.addr_lt a_6 a_2 → a_3 a_6 = t_2 a_6) → (∀(a_6 : Memory.addr), t_2 a_6 = i → Memory.addr_lt a_6 a → Memory.addr_le a_1 a_6 → a_3 a_6 = i_1) → (∀(a_6 : Memory.addr), let x_1 : ℤ := t_2 a_6; ¬x_1 = i → Memory.addr_lt a_6 a → Memory.addr_le a_1 a_6 → a_3 a_6 = x_1) → Memory.addr_le a_1 a_5 ∧ Memory.addr_le a_5 a_2
  := sorry
end strreplace_Why3_ide_VCstrreplace_loop_inv_3_preserved_goal6
