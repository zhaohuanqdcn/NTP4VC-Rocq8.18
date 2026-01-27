import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.push_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.push_heap.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace push_heap_Why3_ide_VCpush_heap_assert_rte_mem_access_goal2
theorem goal2 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := i - (1 : ℤ); (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Axiomatic.p_isheap t_1 a x → Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x)) (1 : ℤ)
  := sorry
end push_heap_Why3_ide_VCpush_heap_assert_rte_mem_access_goal2
