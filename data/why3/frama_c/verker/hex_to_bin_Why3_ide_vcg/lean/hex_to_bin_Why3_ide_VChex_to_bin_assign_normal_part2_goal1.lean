import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace hex_to_bin_Why3_ide_VChex_to_bin_assign_normal_part2_goal1
theorem goal1 (i : ℤ) (fact0 : Cint.is_sint8 i) (fact1 : Cint.is_sint8 (A_Ctype.l_tolower i)) : ¬(i ≤ (47 : ℤ) ∨ (58 : ℤ) ≤ i)
  := sorry
end hex_to_bin_Why3_ide_VChex_to_bin_assign_normal_part2_goal1
