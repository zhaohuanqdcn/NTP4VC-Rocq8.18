import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_StrCmp.A_StrCmp
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strcmp_Why3_ide_VCstrcmp_equal_post_goal15
theorem goal15 (a_2 : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) : let x : ℤ := Memory.addr.offset a_2; let x_1 : ℤ := Memory.addr.offset a_3; let x_2 : ℤ := A_Strlen.l_strlen t_1 a_3; let x_3 : ℤ := t_1 a; let x_4 : ℤ := t_1 a_2; let x_5 : ℤ := Cint.to_uint8 x_4; let x_6 : ℤ := x - x_1; let x_7 : ℤ := t_2 (Memory.shift a_3 x_6); let x_8 : ℤ := t_2 (Memory.shift a_1 x_6); let x_9 : ℤ := Cint.to_uint8 (t_2 a); A_StrCmp.l_strcmp t_1 a_3 a_1 = A_StrCmp.l_strcmp t_1 a_2 a → Memory.addr.offset a_1 + x = Memory.addr.offset a + x_1 → x_1 + x_2 = x + A_Strlen.l_strlen t_1 a_2 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint8 i_3 → Cint.is_sint32 i_1 → Memory.addr_le a_1 a → Memory.addr_le a_3 a_2 → Cint.is_sint8 x_3 → Cint.is_sint8 x_4 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Memory.addr_le a (Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1)) → Memory.addr_le a_2 (Memory.shift a_3 x_2) → (if x_5 = Cint.to_uint8 x_3 then i_1 = (0 : ℤ) ∧ x_5 = (0 : ℤ) else i_2 = i ∧ t_2 = t_1 ∧ Cint.to_uint8 (t_2 a_2) = i_3 ∧ ¬x_7 = x_8 ∧ x_1 ≤ x ∧ x ≤ x_1 + A_Strlen.l_strlen t_2 a_3 ∧ (if i_3 < x_9 then i_1 = -(1 : ℤ) else i_1 = (1 : ℤ)) ∧ (if i_3 < x_9 then i_2 = -(1 : ℤ) else i_2 = (1 : ℤ)) ∧ (if Cint.to_uint8 x_7 < Cint.to_uint8 x_8 then i_2 = -(1 : ℤ) else i_2 = (1 : ℤ)) ∧ (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + x_1 < x → t_2 (Memory.shift a_3 i_4) = t_2 (Memory.shift a_1 i_4))) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 ≤ x_2 → t_1 (Memory.shift a_3 i_4) = t_1 (Memory.shift a_1 i_4)) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + x_1 < x → t_1 (Memory.shift a_3 i_4) = t_1 (Memory.shift a_1 i_4)) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 ≤ x_2 → Cint.to_uint8 (t_1 (Memory.shift a_3 i_4)) = Cint.to_uint8 (t_1 (Memory.shift a_1 i_4))) → i_1 = (0 : ℤ)
  := sorry
end strcmp_Why3_ide_VCstrcmp_equal_post_goal15
