import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace random_number_Why3_ide_VCrandom_number_post_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (fact0 : (0 : ℤ) < i) (fact1 : (0 : ℤ) ≤ i_1) (fact2 : i_1 ≤ (2147483647 : ℤ)) (fact3 : i_1 ≤ (4294967295 : ℤ)) (fact4 : Cint.is_uint32 i) (fact5 : Cint.is_sint32 i_1) : Cint.to_uint32 (Int.tmod i_1 i) < i
  := sorry
end random_number_Why3_ide_VCrandom_number_post_goal0
