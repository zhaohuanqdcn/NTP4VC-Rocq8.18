import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.random_shuffle.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.random_shuffle.lib.lean.Compound.Compound
import frama_c.standard_algorithms.random_shuffle.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace CountSectionUnion_Why3_ide_VCCountSectionUnion_loop_inv_2_established_goal3
theorem goal3 (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (i_2 : ℤ) (t : Memory.addr -> ℤ) (fact0 : i_3 ≤ i) (fact1 : i_1 ≤ i_3) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Cint.is_uint32 i) (fact4 : Cint.is_uint32 i_1) (fact5 : Cint.is_uint32 i_3) (fact6 : Cint.is_sint32 i_2) : A_Count.l_count_1' t a i_3 i_3 i_2 = (0 : ℤ)
  := sorry
end CountSectionUnion_Why3_ide_VCCountSectionUnion_loop_inv_2_established_goal3
