import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.selection_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.selection_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace CountSectionUnion_Why3_ide_VCCountSectionUnion_assert_rte_unsigned_overflow_goal4
theorem goal4 (i_2 : ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : i_2 ≤ i) (fact1 : i_3 ≤ i) (fact2 : i_1 ≤ i_2) (fact3 : i_3 < i) (fact4 : i_2 ≤ i_3) (fact5 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact6 : Cint.is_uint32 i) (fact7 : Cint.is_uint32 i_1) (fact8 : Cint.is_uint32 i_2) (fact9 : Cint.is_uint32 i_3) (fact10 : ∀(i_4 : ℤ), Cint.is_sint32 i_4 → A_Count.l_count_1' t a i_1 i_2 i_4 + A_Count.l_count_1' t a i_2 i_3 i_4 = A_Count.l_count_1' t a i_1 i_3 i_4) : i_3 ≤ (4294967294 : ℤ)
  := sorry
end CountSectionUnion_Why3_ide_VCCountSectionUnion_assert_rte_unsigned_overflow_goal4
