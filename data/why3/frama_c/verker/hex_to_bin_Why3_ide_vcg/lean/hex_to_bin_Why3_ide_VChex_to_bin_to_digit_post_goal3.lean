import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace hex_to_bin_Why3_ide_VChex_to_bin_to_digit_post_goal3
theorem goal3 (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := A_Ctype.l_tolower i_3; let x_1 : ℤ := (87 : ℤ) + i; let x_2 : ℤ := (87 : ℤ) + i_1; Cint.is_sint8 i_2 → Cint.is_sint8 i_3 → Cint.is_sint32 i → Cint.is_sint32 i_1 → A_Ctype.p_isxdigit i_3 → (if (48 : ℤ) ≤ i_3 then if i_3 ≤ (57 : ℤ) then i_1 = i ∧ (48 : ℤ) + i_1 = i_3 else x = i_2 ∧ (if (97 : ℤ) ≤ i_2 then if i_2 ≤ (102 : ℤ) then x_1 = i_2 ∧ x_2 = i_2 else i = -(1 : ℤ) ∧ i_1 = -(1 : ℤ) else i = -(1 : ℤ) ∧ i_1 = -(1 : ℤ)) else x = i_2 ∧ (if (97 : ℤ) ≤ i_2 then if i_2 ≤ (102 : ℤ) then x_1 = i_2 ∧ x_2 = i_2 else i = -(1 : ℤ) ∧ i_1 = -(1 : ℤ) else i = -(1 : ℤ) ∧ i_1 = -(1 : ℤ))) → (0 : ℤ) ≤ i_1 ∧ i_1 ≤ (15 : ℤ)
  := sorry
end hex_to_bin_Why3_ide_VChex_to_bin_to_digit_post_goal3
