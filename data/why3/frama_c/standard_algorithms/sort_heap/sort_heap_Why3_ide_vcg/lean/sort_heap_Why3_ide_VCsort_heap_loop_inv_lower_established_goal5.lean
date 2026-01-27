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
namespace sort_heap_Why3_ide_VCsort_heap_loop_inv_lower_established_goal5
theorem goal5 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i : ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Axiomatic.p_isheap t_1 a i → Cint.is_sint32 x → Memory.valid_rw t a_1 i → Axiomatic1.p_lowerbound_1' t_1 a i i x
  := sorry
end sort_heap_Why3_ide_VCsort_heap_loop_inv_lower_established_goal5
