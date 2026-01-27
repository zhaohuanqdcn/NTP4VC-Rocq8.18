import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace PositiveCountImpliesHasValueGeneral_Why3_ide_VCPositiveCountImpliesHasValueGeneral_assert_rte_unsigned_o____goal4
theorem goal4 (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : i_2 ≤ i) (fact1 : i_1 < i) (fact2 : i_2 < i) (fact3 : i_1 ≤ i_2) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : Cint.is_uint32 i) (fact6 : Cint.is_uint32 i_1) (fact7 : Cint.is_uint32 i_2) (fact8 : ∀(i_3 : ℤ), Cint.is_sint32 i_3 → (∀(i_4 : ℤ), i_1 ≤ i_4 → i_4 < i_2 → ¬t (Memory.shift a i_4) = i_3) → A_Count.l_count_1' t a i_1 i_2 i_3 = (0 : ℤ)) : i_2 ≤ (4294967294 : ℤ)
  := sorry
end PositiveCountImpliesHasValueGeneral_Why3_ide_VCPositiveCountImpliesHasValueGeneral_assert_rte_unsigned_o____goal4
