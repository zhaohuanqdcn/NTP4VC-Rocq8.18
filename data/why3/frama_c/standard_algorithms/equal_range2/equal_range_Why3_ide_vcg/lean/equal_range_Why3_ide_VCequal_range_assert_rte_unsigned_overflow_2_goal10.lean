import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.equal_range2.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.equal_range2.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace equal_range_Why3_ide_VCequal_range_assert_rte_unsigned_overflow_2_goal10
theorem goal10 (i_2 : ℤ) (i_1 : ℤ) (i_3 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i_2 ≤ i_1) (fact1 : i_3 ≤ i_2) (fact2 : (0 : ℤ) ≤ i_3) (fact3 : i_3 < i_2) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : Memory.linked t) (fact6 : Cint.is_uint32 i_1) (fact7 : Cint.is_uint32 i_2) (fact8 : Cint.is_uint32 i_3) (fact9 : Cint.is_sint32 i) (fact10 : Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_1) (fact11 : Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_3 i) (fact12 : Axiomatic.p_strictlowerbound_1' t_1 a i_2 i_1 i) (fact13 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) : i_2 ≤ (4294967295 : ℤ) + i_3
  := sorry
end equal_range_Why3_ide_VCequal_range_assert_rte_unsigned_overflow_2_goal10
