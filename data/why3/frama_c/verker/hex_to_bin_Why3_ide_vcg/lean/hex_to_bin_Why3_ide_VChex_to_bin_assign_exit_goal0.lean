import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace hex_to_bin_Why3_ide_VChex_to_bin_assign_exit_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (fact0 : Cint.is_sint8 i) (fact1 : Cint.is_sint8 i_1) : ¬(i ≤ (47 : ℤ) ∨ i_1 = i ∧ (58 : ℤ) ≤ i_1)
  := sorry
end hex_to_bin_Why3_ide_VChex_to_bin_assign_exit_goal0
