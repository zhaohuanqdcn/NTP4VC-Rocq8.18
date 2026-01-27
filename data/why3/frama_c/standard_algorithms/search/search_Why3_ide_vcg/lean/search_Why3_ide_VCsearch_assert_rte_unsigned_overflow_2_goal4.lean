import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search.lib.lean.Compound.Compound
import frama_c.standard_algorithms.search.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace search_Why3_ide_VCsearch_assert_rte_unsigned_overflow_2_goal4
theorem goal4 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i ≤ i_1) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact3 : i + i_2 ≤ (1 : ℤ) + i_1) (fact4 : Memory.linked t) (fact5 : Cint.is_uint32 i) (fact6 : Cint.is_uint32 i_1) (fact7 : Cint.is_uint32 i_2) (fact8 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact9 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) (fact10 : ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) (i + i_2 - (1 : ℤ)) a i) : i_1 ≤ (4294967295 : ℤ) + i
  := sorry
end search_Why3_ide_VCsearch_assert_rte_unsigned_overflow_2_goal4
