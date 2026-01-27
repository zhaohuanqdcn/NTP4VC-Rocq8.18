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
namespace strncasecmp_Why3_ide_VCstrncasecmp_equal_post_goal22
theorem goal22 (a_2 : Memory.addr) (a : Memory.addr) (i_3 : ℤ) (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (i_8 : ℤ) (i_5 : ℤ) (t : ℤ -> ℤ) (i_6 : ℤ) (i_7 : ℤ) (i_9 : ℤ) (i_10 : ℤ) (i_11 : ℤ) (i_12 : ℤ) (i_13 : ℤ) (i : ℤ) (i_1 : ℤ) (i_4 : ℤ) : let x : ℤ := Memory.addr.offset a_2; let x_1 : ℤ := Memory.addr.offset a; let x_3 : ℤ := i_3 + x - x_1; let x_4 : ℤ := A_Strnlen.l_strnlen t_1 a_2 i_3; let x_5 : ℤ := A_Strnlen.l_strnlen t_1 a_3 i_3; let x_6 : ℤ := i_3 + x; let x_7 : ℤ := t_1 a; let x_8 : ℤ := t_1 a_1; let x_9 : ℤ := Cint.to_uint8 x_8; let x_10 : ℤ := Cint.to_uint8 x_7; let x_11 : ℤ := i_2 + i_8; let x_12 : ℤ := i_5 + x_1; let x_13 : ℤ := Cint.to_uint64 (i_3 + x - (1 : ℤ) - x_1); ¬i_3 = (0 : ℤ) → Memory.addr.offset a_1 + x = x_1 + Memory.addr.offset a_3 → x + A_Strnlen.l_strnlen t_1 a x_3 = x_1 + x_4 → x + A_Strnlen.l_strnlen t_1 a_1 x_3 = x_1 + x_5 → x ≤ x_1 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → x_1 ≤ x_6 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint8 i_6 → Cint.is_uint8 i_7 → Cint.is_uint8 i_8 → Cint.is_uint8 i_9 → Cint.is_uint8 i_10 → Cint.is_uint8 i_11 → Cint.is_uint8 i_12 → Cint.is_uint8 i_13 → Cint.is_sint8 i → Cint.is_sint8 i_1 → Cint.is_sint32 i_2 → Cint.is_uint64 i_3 → Cint.is_uint64 i_4 → Cint.is_uint64 i_5 → Memory.addr_le a_2 a → Memory.addr_le a_3 a_1 → Cint.is_sint8 x_7 → Cint.is_sint8 x_8 → A_Strnlen.p_valid_strn t t_1 a_2 i_3 → A_Strnlen.p_valid_strn t t_1 a_3 i_3 → Cint.is_uint64 x_3 → Memory.addr_le a (Memory.shift a_2 x_4) → Memory.addr_le a_1 (Memory.shift a_3 x_5) → A_Strnlen.p_valid_strn t t_1 a x_3 → A_Strnlen.p_valid_strn t t_1 a_1 x_3 → (if x_9 = (0 : ℤ) then i_13 = (0 : ℤ) ∧ x_10 = i_8 ∧ x_11 = (0 : ℤ) else x_10 = i_6 ∧ (if i_6 = (0 : ℤ) then i_8 = (0 : ℤ) ∧ i_12 = i_2 ∧ i_13 = i_2 ∧ i_13 = i_12 ∧ x_9 = i_2 else i_7 = i_6 ∧ x_9 = i_9 ∧ x_11 = i_13 ∧ (if i_9 = i_6 then i_8 = i_6 ∧ i_13 = i_9 ∧ x_12 = x_6 ∧ x_13 = (0 : ℤ) else i_10 = i_9 ∧ i_13 = i_11 ∧ Cint.to_uint8 i = i_8 ∧ Cint.to_uint8 i_1 = i_13 ∧ A_Ctype.l_tolower x_7 = i ∧ A_Ctype.l_tolower x_8 = i_1 ∧ i_4 + x_1 = x_6 ∧ (¬i_13 = i_8 ∨ x_12 = x_6 ∧ x_13 = (0 : ℤ))))) → (∀(i_14 : ℤ), (0 : ℤ) ≤ i_14 → i_14 + x < x_1 → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_14)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_14))) → (∀(i_14 : ℤ), (0 : ℤ) ≤ i_14 → i_14 ≤ x_5 → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_14)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_14))) → i_2 = (0 : ℤ)
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_equal_post_goal22
