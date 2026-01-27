import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_post_goal2
theorem goal2 (a_1 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (a_3 : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (i : ℤ) (p_2 : Bool) (p_3 : Bool) (p : Bool) (p_1 : Bool) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := Memory.addr.offset a_2; let x_2 : ℤ := Memory.addr.offset a; let x_3 : ℤ := Memory.addr.offset a_3; let x_4 : ℤ := i_1 + x_2 - x; let x_5 : ℤ := A_Strnlen.l_strnlen t_1 a i_1; let x_6 : ℤ := x_2 + x_5; let x_7 : ℤ := A_Strnlen.l_strnlen t_1 a_2 i_1; let x_8 : ℤ := i_1 + x_2; x + x_1 = x_2 + x_3 → x + A_Strnlen.l_strnlen t_1 a_1 x_4 = x_6 → x_3 + A_Strnlen.l_strnlen t_1 a_3 x_4 = x_1 + x_7 → x_2 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x ≤ x_8 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint8 i_2 → Cint.is_uint8 i_3 → Cint.is_sint32 i → Cint.is_uint64 i_1 → Memory.addr_le a a_1 → Memory.addr_le a_2 a_3 → A_Strnlen.p_valid_strn t t_1 a i_1 → A_Strnlen.p_valid_strn t t_1 a_2 i_1 → Cint.is_uint64 x_4 → Memory.addr_le a_1 (Memory.shift a x_5) → Memory.addr_le a_3 (Memory.shift a_2 x_7) → A_Strnlen.p_valid_strn t t_1 a_1 x_4 → A_Strnlen.p_valid_strn t t_1 a_3 x_4 → (if x_8 = x then i = (0 : ℤ) else p_2 = false ∧ p_3 = false ∧ Cint.to_uint8 (t_1 a_1) = i_2 ∧ Cint.to_uint8 (t_1 a_3) = i_3 ∧ (if i_3 = i_2 then i = (0 : ℤ) ∧ i_3 = (0 : ℤ) else p = false ∧ p_1 = false ∧ (if i_3 < i_2 then i = -(1 : ℤ) else i = (1 : ℤ))) ∧ (i_2 = (0 : ℤ) → x_5 = A_Strlen.l_strlen t_1 a ∧ x_6 = x ∧ A_Strlen.p_valid_str t t_1 a) ∧ (i_3 = (0 : ℤ) → x_7 = A_Strlen.l_strlen t_1 a_2 ∧ x_2 + x_7 = x ∧ A_Strlen.p_valid_str t t_1 a_2)) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + x_2 < x → t_1 (Memory.shift a_2 i_4) = t_1 (Memory.shift a i_4)) → (∀(i_4 : ℤ), let x_9 : ℤ := t_1 (Memory.shift a_2 i_4); let x_10 : ℤ := t_1 (Memory.shift a i_4); (0 : ℤ) ≤ i_4 → i_4 < x_7 → (Cint.to_uint8 x_9 = Cint.to_uint8 x_10) = (x_9 = x_10)) → i = -(1 : ℤ) ∨ i = (0 : ℤ) ∨ i = (1 : ℤ)
  := sorry
end strncmp_Why3_ide_VCstrncmp_post_goal2
