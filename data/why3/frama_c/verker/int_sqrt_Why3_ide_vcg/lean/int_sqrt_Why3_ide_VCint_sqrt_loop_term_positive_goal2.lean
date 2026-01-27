import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace int_sqrt_Why3_ide_VCint_sqrt_loop_term_positive_goal2
theorem goal2 (i_1 : ℤ) (i : ℤ) (fact0 : ¬i_1 = (0 : ℤ)) (fact1 : (2 : ℤ) ≤ i) (fact2 : Cint.is_uint64 i) (fact3 : Cint.is_uint64 i_1) : (0 : ℤ) ≤ i_1
  := sorry
end int_sqrt_Why3_ide_VCint_sqrt_loop_term_positive_goal2
