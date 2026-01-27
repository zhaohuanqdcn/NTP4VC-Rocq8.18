import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.lower_bound.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.lower_bound.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace lower_bound_Why3_ide_VClower_bound_assert_rte_mem_access_goal11
theorem goal11 (i_1 : ℤ) (i_3 : ℤ) (i_2 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := i_1 - i_3; let x_1 : ℤ := i_3 + Cint.to_uint32 (Int.tdiv (Cint.to_uint32 x) (2 : ℤ)); let x_2 : ℤ := i_3 + Int.tdiv x (2 : ℤ); i_3 ≤ i_1 → i_1 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_3 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_1 → i_1 ≤ (4294967295 : ℤ) + i_3 → x_1 ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_2 → Axiomatic.p_lowerbound_1' t_1 a i_1 i_2 i → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_3 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_2 → Cint.is_uint32 x_2 → Memory.valid_rd t (Memory.shift a x_2) (1 : ℤ)
  := sorry
end lower_bound_Why3_ide_VClower_bound_assert_rte_mem_access_goal11
