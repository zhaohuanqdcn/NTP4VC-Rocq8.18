import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace PositiveCountImpliesHasValue_Why3_ide_VCPositiveCountImpliesHasValue_post_goal0
theorem goal0 (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (i : ℤ) (fact0 : i_3 ≤ i_1) (fact1 : i_2 < i_1) (fact2 : i_1 ≤ i_3) (fact3 : i_2 ≤ i_3) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : (0 : ℤ) < A_Count.l_count_1' t a i_2 i_1 i) (fact6 : Cint.is_uint32 i_1) (fact7 : Cint.is_uint32 i_2) (fact8 : Cint.is_uint32 i_3) (fact9 : Cint.is_sint32 i) (fact10 : (∀(i_4 : ℤ), i_2 ≤ i_4 → i_4 < i_3 → ¬t (Memory.shift a i_4) = i) → A_Count.l_count_1' t a i_2 i_3 i = (0 : ℤ)) : Axiomatic1.p_hasvalue_1' t a i_2 i_3 i
  := sorry
end PositiveCountImpliesHasValue_Why3_ide_VCPositiveCountImpliesHasValue_post_goal0
