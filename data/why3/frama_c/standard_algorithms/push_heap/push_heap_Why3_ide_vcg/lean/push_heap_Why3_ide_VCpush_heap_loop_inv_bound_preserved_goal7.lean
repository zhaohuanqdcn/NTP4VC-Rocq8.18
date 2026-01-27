import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.push_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.push_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.push_heap.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.push_heap.lib.lean.A_Count.A_Count
open Classical
open Lean4Why3
namespace push_heap_Why3_ide_VCpush_heap_loop_inv_bound_preserved_goal7
theorem goal7 (i : ℤ) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i - (1 : ℤ); let x_1 : ℤ := Axiomatic.l_heapparent x; let a_1 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_2 a_1; let a_2 : Memory.addr := Memory.shift a x; let x_3 : ℤ := t_2 a_2; let m : Memory.addr -> ℤ := Function.update t_2 a_2 x_2; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 m a_3 i; let a_5 : Memory.addr := Memory.shift a i_1; let a_6 : ℤ := a_4 a_5; let x_4 : ℤ := Axiomatic.l_heapparent i_1; let a_7 : Memory.addr := Memory.shift a x_4; let a_8 : ℤ := a_4 a_7; let a_9 : Memory.addr := Memory.shift a (Cint.to_uint32 x); (0 : ℤ) < i → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℤ) < x_1 → x_2 < x_3 → a_6 < x_3 → a_8 < x_3 → (2 : ℤ) ≤ i → (2 : ℤ) + i_1 ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x_4 → Memory.valid_rd t a_5 (1 : ℤ) → Memory.valid_rw t a_3 i → Cint.is_uint32 x_1 → Axiomatic.p_isheap t_2 a x → Memory.valid_rd t a_7 (1 : ℤ) → Cint.is_uint32 (Axiomatic.l_heapparent x_1) → Cint.is_sint32 x_3 → Cint.is_sint32 x_2 → Memory.valid_rd t a_9 (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rw t a_9 (1 : ℤ) → Cint.is_sint32 (m a_1) → Cint.is_sint32 a_6 → Cint.is_sint32 a_8 → Axiomatic.p_isheap a_4 a i → Axiomatic1.p_multisetminus a_4 t_2 a i x_3 → Axiomatic1.p_multisetadd a_4 t_2 a i a_6 → Axiomatic1.p_multisetretainrest_3' a_4 t_2 a i x_3 a_6 → a_8 ≤ a_6 ∨ Memory.valid_rw t a_5 (1 : ℤ) → (0 : ℤ) ≤ x_4 ∧ (2 : ℤ) + x_4 ≤ i
  := sorry
end push_heap_Why3_ide_VCpush_heap_loop_inv_bound_preserved_goal7
