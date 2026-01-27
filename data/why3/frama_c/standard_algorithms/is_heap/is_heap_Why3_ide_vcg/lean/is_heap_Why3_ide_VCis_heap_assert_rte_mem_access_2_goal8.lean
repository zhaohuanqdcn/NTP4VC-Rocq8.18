import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.is_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_heap.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace is_heap_Why3_ide_VCis_heap_assert_rte_mem_access_2_goal8
theorem goal8 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := Axiomatic.l_heapparent i_1; i_1 < i → (0 : ℤ) ≤ x → x < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_1 ≤ (1 : ℤ) + i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x → Axiomatic.p_isheap t_1 a i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a i_1) (1 : ℤ)
  := sorry
end is_heap_Why3_ide_VCis_heap_assert_rte_mem_access_2_goal8
