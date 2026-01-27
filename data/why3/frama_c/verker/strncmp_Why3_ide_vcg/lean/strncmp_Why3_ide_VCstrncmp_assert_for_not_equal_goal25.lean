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
namespace strncmp_Why3_ide_VCstrncmp_assert_for_not_equal_goal25
theorem goal25 (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := t_1 a_3; let x_1 : ℤ := Cint.to_uint8 x; let x_2 : ℤ := t_1 a_2; let x_3 : ℤ := Cint.to_uint8 x_2; let x_4 : ℤ := Memory.addr.offset a_1; let x_5 : ℤ := Memory.addr.offset a_2; let x_6 : ℤ := Memory.addr.offset a; let x_7 : ℤ := Memory.addr.offset a_3; let x_9 : ℤ := i_2 + x_5 - x_6; let x_10 : ℤ := A_Strnlen.l_strnlen t_1 a x_9; let x_11 : ℤ := x_6 + x_10; let x_12 : ℤ := A_Strnlen.l_strnlen t_1 a_1 x_9; let x_13 : ℤ := x_6 + x_12; let x_14 : ℤ := x_5 - x_6; let x_15 : ℤ := t_1 (Memory.shift a_1 x_14); let x_16 : ℤ := t_1 (Memory.shift a x_14); ¬i_2 = (0 : ℤ) → ¬x_1 = x_3 → ¬t_1 (Memory.shift a_1 i_1) = t_1 (Memory.shift a i_1) → x_4 + x_5 = x_6 + x_7 → x_11 = x_5 + A_Strnlen.l_strnlen t_1 a_2 i_2 → x_4 + x_12 = x_7 + A_Strnlen.l_strnlen t_1 a_3 i_2 → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → x_6 ≤ x_5 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_6 < i_2 + x_5 → i_1 < x_12 → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Cint.is_uint64 i_2 → Memory.addr_le a a_2 → Memory.addr_le a_1 a_3 → Cint.is_sint8 x_2 → Cint.is_sint8 x → A_Strnlen.p_valid_strn t t_1 a_2 i_2 → A_Strnlen.p_valid_strn t t_1 a_3 i_2 → Cint.is_uint64 x_9 → A_Strnlen.p_valid_strn t t_1 a x_9 → A_Strnlen.p_valid_strn t t_1 a_1 x_9 → Memory.addr_le a_2 (Memory.shift a x_10) → Memory.addr_le a_3 (Memory.shift a_1 x_12) → (if x_1 < x_3 then i = -(1 : ℤ) else i = (1 : ℤ)) → (x_3 = (0 : ℤ) → x_10 = A_Strlen.l_strlen t_1 a ∧ x_11 = x_5 ∧ A_Strlen.p_valid_str t t_1 a) → (x_1 = (0 : ℤ) → x_12 = A_Strlen.l_strlen t_1 a_1 ∧ x_13 = x_5 ∧ A_Strlen.p_valid_str t t_1 a_1) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + x_6 < x_5 → t_1 (Memory.shift a_1 i_3) = t_1 (Memory.shift a i_3)) → (∀(i_3 : ℤ), let x_17 : ℤ := t_1 (Memory.shift a_1 i_3); let x_18 : ℤ := t_1 (Memory.shift a i_3); (0 : ℤ) ≤ i_3 → i_3 < x_12 → (Cint.to_uint8 x_17 = Cint.to_uint8 x_18) = (x_17 = x_18)) → ¬x_15 = x_16 ∧ x_6 + Cint.to_uint64 x_14 = x_5 ∧ x_5 < x_13 ∧ (if Cint.to_uint8 x_15 < Cint.to_uint8 x_16 then i = -(1 : ℤ) else i = (1 : ℤ))
  := sorry
end strncmp_Why3_ide_VCstrncmp_assert_for_not_equal_goal25
