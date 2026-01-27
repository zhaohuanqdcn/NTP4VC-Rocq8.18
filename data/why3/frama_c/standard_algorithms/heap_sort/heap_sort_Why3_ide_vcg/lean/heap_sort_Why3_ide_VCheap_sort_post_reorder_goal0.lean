import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.heap_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.heap_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.heap_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.heap_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace heap_sort_Why3_ide_VCheap_sort_post_reorder_goal0
theorem goal0 (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_2 t_3 a_1 i; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_1 i; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t a_1 i → Axiomatic1.p_sorted_1' a_2 a (0 : ℤ) i → Axiomatic1.p_isheap a_3 a i → Axiomatic1.p_multisetunchanged_1' a_3 t_3 a (0 : ℤ) i → Axiomatic1.p_multisetunchanged_1' a_2 a_3 a (0 : ℤ) i → Axiomatic1.p_multisetunchanged_1' a_2 t_3 a (0 : ℤ) i
  := sorry
end heap_sort_Why3_ide_VCheap_sort_post_reorder_goal0
