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
namespace push_heap_Why3_ide_VCpush_heap_post_heap_goal0
theorem goal0 (a : Memory.addr) (i_1 : ℤ) (i_5 : ℤ) (t_4 : Memory.addr -> ℤ) (i_3 : ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) (i_4 : ℤ) (p_1 : Bool) (t_3 : Memory.addr -> ℤ) (p : Bool) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := i_1 - (1 : ℤ); let a_2 : Memory.addr := Memory.shift a i_5; let a_3 : Memory.addr := Memory.shift a (Cint.to_uint32 x); let x_1 : ℤ := t_4 a_2; let a_4 : Memory.addr := Memory.shift a x; let x_2 : ℤ := t_4 a_4; let a_5 : Memory.addr := Memory.shift a i_3; let m : Memory.addr -> ℤ := Function.update t_4 a_4 x_1; let x_3 : ℤ := t_2 a_5; let a_6 : Memory.addr := Memory.shift a i; (0 : ℤ) < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_uint32 i_5 → Memory.valid_rw t a_1 i_1 → Axiomatic.p_isheap t_4 a x → (if (2 : ℤ) ≤ i_1 then p_1 = false ∧ Axiomatic.l_heapparent x = i_5 ∧ Memory.valid_rd t a_2 (1 : ℤ) ∧ Memory.valid_rd t a_3 (1 : ℤ) ∧ (if x_1 < x_2 then Function.update t_2 a_5 x_2 = t_3 ∧ Memory.valid_rw t a_5 (1 : ℤ) ∧ Memory.valid_rw t a_3 (1 : ℤ) ∧ (if (0 : ℤ) < i_5 then p = false ∧ i_3 = i_2 ∧ i_4 = i_2 ∧ i_4 = i_3 ∧ Axiomatic.l_heapparent i_3 = i ∧ Memory.havoc t_1 m a_1 i_1 = t_2 ∧ (0 : ℤ) ≤ i_3 ∧ x_3 < x_2 ∧ (2 : ℤ) + i_3 ≤ i_1 ∧ Axiomatic.p_isheap t_2 a i_1 ∧ Axiomatic1.p_multisetadd t_2 t_4 a i_1 x_3 ∧ Axiomatic1.p_multisetminus t_2 t_4 a i_1 x_2 ∧ Axiomatic1.p_multisetretainrest_3' t_2 t_4 a i_1 x_2 x_3 ∧ (i_3 ≤ (0 : ℤ) ∨ x_2 ≤ t_2 a_6 ∧ Memory.valid_rd t a_6 (1 : ℤ)) else i_5 = i_3 ∧ m = t_2) else t_4 = t_3) else t_4 = t_3) → Axiomatic.p_isheap t_3 a i_1
  := sorry
end push_heap_Why3_ide_VCpush_heap_post_heap_goal0
