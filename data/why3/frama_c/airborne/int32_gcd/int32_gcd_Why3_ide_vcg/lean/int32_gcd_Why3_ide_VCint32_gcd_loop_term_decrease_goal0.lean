import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace int32_gcd_Why3_ide_VCint32_gcd_loop_term_decrease_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (fact0 : ¬i = (0 : ℤ)) (fact1 : Cint.is_uint32 i) (fact2 : Cint.is_uint32 i_1) : Cint.to_uint32 (Int.tmod i_1 i) < i
  := sorry
end int32_gcd_Why3_ide_VCint32_gcd_loop_term_decrease_goal0
