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
namespace strcmp_Why3_ide_VCstrcmp_post_goal0
theorem goal0 (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) (i_3 : ℤ) (i_1 : ℤ) (p : Bool) (p_1 : Bool) (i_2 : ℤ) (i : ℤ) : let x : ℤ := A_StrCmp.l_strcmp t_1 a_3 a_1; let x_1 : ℤ := Memory.addr.offset a_2; let x_2 : ℤ := Memory.addr.offset a_3; let x_3 : ℤ := A_Strlen.l_strlen t_1 a_3; let x_4 : ℤ := x_2 + x_3; let x_5 : ℤ := t_1 a; let x_6 : ℤ := t_1 a_2; let x_7 : ℤ := Cint.to_uint8 x_6; let x_8 : ℤ := Cint.to_uint8 x_5; let x_9 : ℤ := x_1 - x_2; let x_10 : ℤ := t_1 (Memory.shift a_3 x_9); let x_11 : ℤ := t_1 (Memory.shift a_1 x_9); x = A_StrCmp.l_strcmp t_1 a_2 a → Memory.addr.offset a_1 + x_1 = Memory.addr.offset a + x_2 → x_4 = x_1 + A_Strlen.l_strlen t_1 a_2 → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 ≤ x_3 → Cint.to_uint8 (t_1 (Memory.shift a_3 i_4)) = Cint.to_uint8 (t_1 (Memory.shift a_1 i_4))) = (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 ≤ x_3 → t_1 (Memory.shift a_3 i_4) = t_1 (Memory.shift a_1 i_4)) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint8 i_3 → Cint.is_sint32 i_1 → Memory.addr_le a_1 a → Memory.addr_le a_3 a_2 → Cint.is_sint8 x_5 → Cint.is_sint8 x_6 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Memory.addr_le a (Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1)) → Memory.addr_le a_2 (Memory.shift a_3 x_3) → (if x_7 = x_8 then i_1 = (0 : ℤ) ∧ x_7 = (0 : ℤ) else p = false ∧ p_1 = false ∧ i_2 = i ∧ x_7 = i_3 ∧ ¬x_10 = x_11 ∧ x_2 ≤ x_1 ∧ x_1 ≤ x_4 ∧ (if i_3 < x_8 then i_1 = -(1 : ℤ) else i_1 = (1 : ℤ)) ∧ (if i_3 < x_8 then i_2 = -(1 : ℤ) else i_2 = (1 : ℤ)) ∧ (if Cint.to_uint8 x_10 < Cint.to_uint8 x_11 then i_2 = -(1 : ℤ) else i_2 = (1 : ℤ))) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + x_2 < x_1 → t_1 (Memory.shift a_3 i_4) = t_1 (Memory.shift a_1 i_4)) → x = i_1
  := sorry
end strcmp_Why3_ide_VCstrcmp_post_goal0
