import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace HasValueImpliesPositiveCount_Why3_ide_VCHasValueImpliesPositiveCount_post_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (i_3 : ℤ) (a : Memory.addr) (i_2 : ℤ) (t : Memory.addr -> ℤ) (fact0 : i_1 ≤ i) (fact1 : i_3 ≤ i) (fact2 : i ≤ i_3) (fact3 : i_1 ≤ i_3) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : Cint.is_uint32 i) (fact6 : Cint.is_uint32 i_1) (fact7 : Cint.is_uint32 i_3) (fact8 : Cint.is_sint32 i_2) (fact9 : Cint.is_sint32 (t (Memory.shift a i_1))) (fact10 : Cint.is_sint32 (t (Memory.shift a i_3))) (fact11 : Axiomatic1.p_hasvalue_1' t a i_1 i i_2) (fact12 : ∀(i_4 : ℤ), i_1 ≤ i_4 → i_4 < i_3 → (0 : ℤ) < A_Count.l_count_1' t a i_1 i (t (Memory.shift a i_4))) : (0 : ℤ) < A_Count.l_count_1' t a i_1 i_3 i_2
  := sorry
end HasValueImpliesPositiveCount_Why3_ide_VCHasValueImpliesPositiveCount_post_goal0
