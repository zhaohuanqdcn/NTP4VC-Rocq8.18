import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace is_sorted_Why3_ide_VCis_sorted_assert_rte_mem_access_2_goal4
theorem goal4 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := (1 : ℤ) + i_1; (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) + i_1 ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Axiomatic.p_weaklysorted_1' t_1 a (0 : ℤ) x → Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x)) (1 : ℤ)
  := sorry
end is_sorted_Why3_ide_VCis_sorted_assert_rte_mem_access_2_goal4
