import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.sort_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.sort_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.sort_heap.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.sort_heap.lib.lean.A_Count.A_Count
open Classical
open Lean4Why3
namespace sort_heap_Why3_ide_VCsort_heap_call_pop_heap_pre_bounds_goal11
theorem goal11 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i; let a_3 : ℤ := a_2 a_1; i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_isheap t_2 a i → Cint.is_sint32 (t_2 a_1) → Memory.valid_rw t a_1 i → Cint.is_sint32 a_3 → Axiomatic.p_isheap a_2 a i_1 → Axiomatic1.p_sorted_1' a_2 a i_1 i → Axiomatic1.p_multisetunchanged_1' a_2 t_2 a (0 : ℤ) i → Axiomatic1.p_lowerbound_1' a_2 a i_1 i a_3 → (0 : ℤ) < i_1
  := sorry
end sort_heap_Why3_ide_VCsort_heap_call_pop_heap_pre_bounds_goal11
