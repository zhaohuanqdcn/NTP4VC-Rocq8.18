import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.make_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.make_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.make_heap.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.make_heap.lib.lean.A_Count.A_Count
open Classical
open Lean4Why3
namespace make_heap_Why3_ide_VCmake_heap_post_reorder_goal1
theorem goal1 (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (p : Bool) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := (1 : ℤ) + i_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_1 i → (if (0 : ℤ) < i then p = false ∧ Memory.havoc t_1 t_3 a_1 i = t_2 ∧ (0 : ℤ) < i_1 ∧ i_1 ≤ i ∧ i ≤ i_1 ∧ Axiomatic.p_isheap t_2 a i_1 ∧ Axiomatic1.p_multisetunchanged_1' t_2 t_3 a (0 : ℤ) x ∧ Axiomatic.p_unchanged_1' t_2 t_3 a x i else t_3 = t_2) → Axiomatic1.p_multisetunchanged_1' t_2 t_3 a (0 : ℤ) i
  := sorry
end make_heap_Why3_ide_VCmake_heap_post_reorder_goal1
