import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace PositiveCountImpliesHasValue_Why3_ide_VCPositiveCountImpliesHasValue_loop_inv_2_established_goal3
theorem goal3 (i_2 : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (i : ℤ) (fact0 : i_2 < i_1) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : (0 : ℤ) < A_Count.l_count_1' t a i_2 i_1 i) (fact3 : Cint.is_uint32 i_1) (fact4 : Cint.is_uint32 i_2) (fact5 : Cint.is_sint32 i) : A_Count.l_count_1' t a i_2 i_2 i = (0 : ℤ)
  := sorry
end PositiveCountImpliesHasValue_Why3_ide_VCPositiveCountImpliesHasValue_loop_inv_2_established_goal3
