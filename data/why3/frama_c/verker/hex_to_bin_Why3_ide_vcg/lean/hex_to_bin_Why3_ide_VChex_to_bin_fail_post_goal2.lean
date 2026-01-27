import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace hex_to_bin_Why3_ide_VChex_to_bin_fail_post_goal2
theorem goal2 (i_4 : ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_5 : ℤ) : let x : ℤ := A_Ctype.l_tolower i_4; let x_1 : ℤ := (87 : ℤ) + i; let x_2 : ℤ := (87 : ℤ) + i_1; Cint.is_sint8 i_2 → Cint.is_sint8 i_3 → Cint.is_sint8 i_4 → Cint.is_sint8 i_5 → Cint.is_sint32 i → Cint.is_sint32 i_1 → ¬A_Ctype.p_isxdigit i_2 → (if (48 : ℤ) ≤ i_2 then i_3 = i_2 ∧ (if i_3 ≤ (57 : ℤ) then i_1 = i ∧ (48 : ℤ) + i_1 = i_3 else i_4 = i_3 ∧ x = i_5 ∧ (if (97 : ℤ) ≤ i_5 then if i_5 ≤ (102 : ℤ) then x_1 = i_5 ∧ x_2 = i_5 else i = -(1 : ℤ) ∧ i_1 = -(1 : ℤ) else i = -(1 : ℤ) ∧ i_1 = -(1 : ℤ))) else i_4 = i_2 ∧ x = i_5 ∧ (if (97 : ℤ) ≤ i_5 then if i_5 ≤ (102 : ℤ) then x_1 = i_5 ∧ x_2 = i_5 else i = -(1 : ℤ) ∧ i_1 = -(1 : ℤ) else i = -(1 : ℤ) ∧ i_1 = -(1 : ℤ))) → i_1 = -(1 : ℤ)
  := sorry
end hex_to_bin_Why3_ide_VChex_to_bin_fail_post_goal2
