import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.binary_search2.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.binary_search2.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace binary_search_Why3_ide_VCbinary_search_assert_rte_mem_access_goal1
theorem goal1 (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_2; i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_1 → Cint.is_sint32 (t_1 a_1) → Axiomatic.p_lowerbound_1' t_1 a i_2 i_1 i → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_2 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Memory.valid_rd t a_1 (1 : ℤ)
  := sorry
end binary_search_Why3_ide_VCbinary_search_assert_rte_mem_access_goal1
