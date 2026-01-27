import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strcasecmp_Why3_ide_VCstrcasecmp_equal_post_goal16
theorem goal16 (a_1 : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t_3 : Memory.addr -> ℤ) (a_2 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := Memory.addr.offset a_3; let x_2 : ℤ := t_1 a_1; let x_3 : ℤ := t_2 a; let x_4 : ℤ := A_Ctype.l_tolower x_2; let x_5 : ℤ := A_Ctype.l_tolower x_3; let x_6 : ℤ := A_Strlen.l_strlen t_1 a_3; let x_7 : ℤ := x - x_1; let x_8 : ℤ := A_Ctype.l_tolower (t_3 (Memory.shift a_3 x_7)); let x_9 : ℤ := A_Ctype.l_tolower (t_3 (Memory.shift a_2 x_7)); x + Memory.addr.offset a_2 = Memory.addr.offset a + x_1 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_2 a → Memory.addr_le a_3 a_1 → Cint.is_sint8 x_2 → Cint.is_sint8 x_3 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Cint.is_sint8 x_4 → Cint.is_sint8 x_5 → Cint.is_sint32 x_4 → Cint.is_sint32 x_5 → Memory.addr_le a (Memory.shift a_2 (A_Strlen.l_strlen t_1 a_2)) → Memory.addr_le a_1 (Memory.shift a_3 x_6) → Cint.is_sint32 (x_4 - x_5) → (if x_5 = x_4 then i = (0 : ℤ) ∧ x_5 = (0 : ℤ) else i + x_5 = x_4) → (x_5 = x_4 → i = (0 : ℤ) ∧ x_4 = (0 : ℤ)) → (¬x_5 = x_4 → ¬x_8 = x_9 ∧ i + x_9 = x_8 ∧ x_1 ≤ x ∧ x ≤ x_1 + A_Strlen.l_strlen t_3 a_3 ∧ (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_1 < x → A_Ctype.l_tolower (t_3 (Memory.shift a_3 i_1)) = A_Ctype.l_tolower (t_3 (Memory.shift a_2 i_1)))) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_1 < x → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_1)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_1))) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 ≤ x_6 → A_Ctype.l_tolower (t_1 (Memory.shift a_3 i_1)) = A_Ctype.l_tolower (t_1 (Memory.shift a_2 i_1))) → x_5 = x_4
  := sorry
end strcasecmp_Why3_ide_VCstrcasecmp_equal_post_goal16
