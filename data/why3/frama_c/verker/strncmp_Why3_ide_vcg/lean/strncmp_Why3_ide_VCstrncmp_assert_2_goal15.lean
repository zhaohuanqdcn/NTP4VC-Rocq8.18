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
namespace strncmp_Why3_ide_VCstrncmp_assert_2_goal15
theorem goal15 (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (a_2 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a_3; let x_1 : ℤ := Memory.addr.offset a_1; let x_2 : ℤ := i + x_1; let x_3 : ℤ := Memory.addr.offset a_2; let x_4 : ℤ := Memory.addr.offset a_3; let x_5 : ℤ := Memory.addr.offset a; let x_6 : ℤ := i + x_1 - x_3; let x_7 : ℤ := A_Strnlen.l_strnlen t_1 a_1 i; let x_8 : ℤ := A_Strnlen.l_strnlen t_1 a i; Cint.to_uint8 x = (0 : ℤ) → ¬x_2 = x_3 → x_1 + x_4 = x_5 + x_3 → x_3 + A_Strnlen.l_strnlen t_1 a_2 x_6 = x_1 + x_7 → x_4 + A_Strnlen.l_strnlen t_1 a_3 x_6 = x_5 + x_8 → x_1 ≤ x_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_3 ≤ x_2 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → Memory.addr_le a a_3 → Memory.addr_le a_1 a_2 → Cint.is_sint8 x → A_Strnlen.p_valid_strn t t_1 a i → A_Strnlen.p_valid_strn t t_1 a_1 i → Cint.is_uint64 x_6 → Memory.addr_le a_2 (Memory.shift a_1 x_7) → Memory.addr_le a_3 (Memory.shift a x_8) → A_Strnlen.p_valid_strn t t_1 a_2 x_6 → A_Strnlen.p_valid_strn t t_1 a_3 x_6 → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_1 < x_3 → t_1 (Memory.shift a_1 i_1) = t_1 (Memory.shift a i_1)) → (∀(i_1 : ℤ), let x_9 : ℤ := t_1 (Memory.shift a_1 i_1); let x_10 : ℤ := t_1 (Memory.shift a i_1); (0 : ℤ) ≤ i_1 → i_1 < x_8 → (Cint.to_uint8 x_9 = Cint.to_uint8 x_10) = (x_9 = x_10)) → x_8 = A_Strlen.l_strlen t_1 a ∧ x_1 + x_8 = x_3 ∧ A_Strlen.p_valid_str t t_1 a
  := sorry
end strncmp_Why3_ide_VCstrncmp_assert_2_goal15
