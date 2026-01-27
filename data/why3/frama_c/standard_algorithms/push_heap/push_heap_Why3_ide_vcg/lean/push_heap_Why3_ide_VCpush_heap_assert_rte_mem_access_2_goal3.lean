import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.push_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.push_heap.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace push_heap_Why3_ide_VCpush_heap_assert_rte_mem_access_2_goal3
theorem goal3 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := i - (1 : ℤ); let x_1 : ℤ := Axiomatic.l_heapparent x; (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Cint.is_uint32 x_1 → Axiomatic.p_isheap t_1 a x → Cint.is_sint32 (t_1 (Memory.shift a x)) → Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x)) (1 : ℤ) → Memory.valid_rd t (Memory.shift a x_1) (1 : ℤ)
  := sorry
end push_heap_Why3_ide_VCpush_heap_assert_rte_mem_access_2_goal3
