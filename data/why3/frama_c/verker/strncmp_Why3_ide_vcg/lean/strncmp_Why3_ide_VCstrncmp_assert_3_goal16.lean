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
namespace strncmp_Why3_ide_VCstrncmp_assert_3_goal16
theorem goal16 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a_1; let x_1 : ℤ := Memory.addr.offset a; let x_2 : ℤ := i + x_1; let x_3 : ℤ := Memory.addr.offset a_1; let x_4 : ℤ := Memory.addr.offset a_2; let x_5 : ℤ := Memory.addr.offset a_3; let x_6 : ℤ := i + x_1 - x_3; let x_7 : ℤ := A_Strnlen.l_strnlen t_1 a i; let x_8 : ℤ := x_1 + x_7; let x_9 : ℤ := A_Strnlen.l_strnlen t_1 a_2 i; let x_10 : ℤ := t_1 a_3; Cint.to_uint8 x = (0 : ℤ) → ¬x_2 = x_3 → x_3 + x_4 = x_1 + x_5 → x_3 + A_Strnlen.l_strnlen t_1 a_1 x_6 = x_8 → x_5 + A_Strnlen.l_strnlen t_1 a_3 x_6 = x_4 + x_9 → x_1 ≤ x_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x_3 ≤ x_2 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → Memory.addr_le a a_1 → Memory.addr_le a_2 a_3 → Cint.is_sint8 x → Cint.is_sint8 x_10 → A_Strnlen.p_valid_strn t t_1 a i → A_Strnlen.p_valid_strn t t_1 a_2 i → Cint.is_uint64 x_6 → Memory.addr_le a_1 (Memory.shift a x_7) → Memory.addr_le a_3 (Memory.shift a_2 x_9) → A_Strnlen.p_valid_strn t t_1 a_1 x_6 → A_Strnlen.p_valid_strn t t_1 a_3 x_6 → (Cint.to_uint8 x_10 = (0 : ℤ) → x_9 = A_Strlen.l_strlen t_1 a_2 ∧ x_1 + x_9 = x_3 ∧ A_Strlen.p_valid_str t t_1 a_2) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_1 < x_3 → t_1 (Memory.shift a_2 i_1) = t_1 (Memory.shift a i_1)) → (∀(i_1 : ℤ), let x_11 : ℤ := t_1 (Memory.shift a_2 i_1); let x_12 : ℤ := t_1 (Memory.shift a i_1); (0 : ℤ) ≤ i_1 → i_1 < x_9 → (Cint.to_uint8 x_11 = Cint.to_uint8 x_12) = (x_11 = x_12)) → x_7 = A_Strlen.l_strlen t_1 a ∧ x_8 = x_3 ∧ A_Strlen.p_valid_str t t_1 a
  := sorry
end strncmp_Why3_ide_VCstrncmp_assert_3_goal16
