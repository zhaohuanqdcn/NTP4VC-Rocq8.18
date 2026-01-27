import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace strncasecmp_Why3_ide_VCstrncasecmp_not_equal_post_goal23
theorem goal23 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (i_3 : ℤ) (a_3 : Memory.addr) (i_5 : ℤ) (i_7 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (i_8 : ℤ) (i_9 : ℤ) (i_10 : ℤ) (i_11 : ℤ) (i_12 : ℤ) (i_13 : ℤ) (i_14 : ℤ) (i_15 : ℤ) (i : ℤ) (i_1 : ℤ) (i_4 : ℤ) (i_6 : ℤ) : let x : ℤ := t_1 a_1; let x_1 : ℤ := Memory.addr.offset a; let x_2 : ℤ := Memory.addr.offset a_2; let x_3 : ℤ := i_3 + x_1 - x_2; let x_4 : ℤ := A_Strnlen.l_strnlen t_1 a_2 x_3; let x_5 : ℤ := A_Strnlen.l_strnlen t_1 a_3 x_3; let x_6 : ℤ := t_1 a; let x_7 : ℤ := Cint.to_uint8 x_6; let x_8 : ℤ := Cint.to_uint64 (i_5 - (1 : ℤ)); ¬A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_7)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_7)) → (0 : ℤ) ≤ i_7 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → i_7 ≤ A_Strnlen.l_strnlen t_1 a_3 i_2 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint8 i_8 → Cint.is_uint8 i_9 → Cint.is_uint8 i_10 → Cint.is_uint8 i_11 → Cint.is_uint8 i_12 → Cint.is_uint8 i_13 → Cint.is_uint8 i_14 → Cint.is_uint8 i_15 → Cint.is_sint8 i → Cint.is_sint8 i_1 → Cint.is_uint64 i_2 → Cint.is_uint64 i_3 → Cint.is_uint64 i_4 → Cint.is_uint64 i_5 → Cint.is_uint64 i_6 → A_Strnlen.p_valid_strn t t_1 a_2 i_2 → A_Strnlen.p_valid_strn t t_1 a_3 i_2 → ¬(i_2 = (0 : ℤ) ∨ i_6 = i_3 ∧ Cint.to_uint8 x = i_11 ∧ i_3 + x_1 = i_2 + x_2 ∧ Memory.addr.offset a_1 + x_2 = x_1 + Memory.addr.offset a_3 ∧ x_1 + x_4 = x_2 + A_Strnlen.l_strnlen t_1 a i_3 ∧ x_1 + x_5 = x_2 + A_Strnlen.l_strnlen t_1 a_1 i_3 ∧ (0 : ℤ) ≤ i_3 ∧ x_2 ≤ x_1 ∧ Memory.addr_le a_2 a ∧ Memory.addr_le a_3 a_1 ∧ A_Strnlen.p_valid_strn t t_1 a i_3 ∧ A_Strnlen.p_valid_strn t t_1 a_1 i_3 ∧ Memory.addr_le a (Memory.shift a_2 x_4) ∧ Memory.addr_le a_1 (Memory.shift a_3 x_5) ∧ (if i_11 = (0 : ℤ) then i_10 = (0 : ℤ) ∧ i_15 = (0 : ℤ) ∧ x_7 = i_10 else x_7 = i_8 ∧ (if i_8 = (0 : ℤ) then i_10 = (0 : ℤ) ∧ i_11 = (0 : ℤ) ∧ i_14 = (0 : ℤ) ∧ i_14 = i_11 ∧ i_15 = (0 : ℤ) ∧ i_15 = i_11 ∧ i_15 = i_14 else i_9 = i_8 ∧ i_12 = i_11 ∧ i_15 = i_10 ∧ (if i_11 = i_8 then i_5 = i_3 ∧ i_10 = i_8 ∧ i_15 = i_11 ∧ x_8 = (0 : ℤ) else i_4 = i_3 ∧ i_15 = i_13 ∧ Cint.to_uint8 i = i_10 ∧ Cint.to_uint8 i_1 = i_15 ∧ A_Ctype.l_tolower (Cint.to_sint8 x_6) = i ∧ A_Ctype.l_tolower (Cint.to_sint8 x) = i_1 ∧ (¬i_15 = i_10 ∨ i_5 = i_4 ∧ x_8 = (0 : ℤ))))) ∧ (∀(i_16 : ℤ), (0 : ℤ) ≤ i_16 → i_16 + x_2 < x_1 → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_16)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_16))))
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_not_equal_post_goal23
