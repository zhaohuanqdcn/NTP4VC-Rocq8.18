import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.sort_heap.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.sort_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.sort_heap.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace CountSectionUnion_Why3_ide_VCCountSectionUnion_post_goal0
theorem goal0 (i_2 : ℤ) (i : ℤ) (i_4 : ℤ) (i_1 : ℤ) (a : Memory.addr) (i_3 : ℤ) (t : Memory.addr -> ℤ) (fact0 : i_2 ≤ i) (fact1 : i_4 ≤ i) (fact2 : i_1 ≤ i_2) (fact3 : i ≤ i_4) (fact4 : i_2 ≤ i_4) (fact5 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact6 : Cint.is_uint32 i) (fact7 : Cint.is_uint32 i_1) (fact8 : Cint.is_uint32 i_2) (fact9 : Cint.is_uint32 i_4) (fact10 : Cint.is_sint32 i_3) (fact11 : ∀(i_5 : ℤ), Cint.is_sint32 i_5 → A_Count.l_count_1' t a i_1 i_2 i_5 + A_Count.l_count_1' t a i_2 i_4 i_5 = A_Count.l_count_1' t a i_1 i_4 i_5) : A_Count.l_count_1' t a i_1 i_2 i_3 + A_Count.l_count_1' t a i_2 i_4 i_3 = A_Count.l_count_1' t a i_1 i_4 i_3
  := sorry
end CountSectionUnion_Why3_ide_VCCountSectionUnion_post_goal0
