import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace CountSectionBounds_Why3_ide_VCCountSectionBounds_assert_rte_unsigned_overflow_goal4
theorem goal4 (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : i_1 ≤ i) (fact1 : i_2 ≤ i) (fact2 : i_2 < i) (fact3 : i_1 ≤ i_2) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : Cint.is_uint32 i) (fact6 : Cint.is_uint32 i_1) (fact7 : Cint.is_uint32 i_2) (fact8 : ∀(i_3 : ℤ), let x : ℤ := A_Count.l_count_1' t a i_1 i_2 i_3; Cint.is_sint32 i_3 → (0 : ℤ) ≤ x ∧ i_1 + x ≤ i_2) : i_2 ≤ (4294967294 : ℤ)
  := sorry
end CountSectionBounds_Why3_ide_VCCountSectionBounds_assert_rte_unsigned_overflow_goal4
