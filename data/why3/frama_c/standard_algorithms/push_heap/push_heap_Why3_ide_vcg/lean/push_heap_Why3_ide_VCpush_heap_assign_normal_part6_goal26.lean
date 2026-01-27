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
namespace push_heap_Why3_ide_VCpush_heap_assign_normal_part6_goal26
theorem goal26 (i_1 : ℤ) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (i_4 : ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_5 : ℤ) (p : Bool) (t_1 : Memory.addr -> ℤ) : let x : ℤ := i_1 - (1 : ℤ); let x_1 : ℤ := Axiomatic.l_heapparent x; let a_1 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_2 a_1; let a_2 : Memory.addr := Memory.shift a x; let x_3 : ℤ := t_2 a_2; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr := Memory.shift a i_4; let a_5 : Memory.addr := Memory.shift a (Cint.to_uint32 x); let x_4 : ℤ := t_3 a_4; let a_6 : Memory.addr := Memory.shift a i; (0 : ℤ) < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_2 < x_3 → (2 : ℤ) ≤ i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_uint32 i_5 → Memory.valid_rw t a_3 i_1 → Memory.valid_rw t a_4 (1 : ℤ) → ¬Memory.invalid t a_4 (1 : ℤ) → Cint.is_uint32 x_1 → Axiomatic.p_isheap t_2 a x → Cint.is_sint32 x_3 → Cint.is_sint32 x_2 → Memory.valid_rd t a_5 (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rw t a_5 (1 : ℤ) → (if (0 : ℤ) < x_1 then p = false ∧ i_4 = i_3 ∧ i_5 = i_3 ∧ i_5 = i_4 ∧ Axiomatic.l_heapparent i_4 = i ∧ x_1 = i_2 ∧ Memory.havoc t_1 (Function.update t_2 a_2 (t_2 (Memory.shift a i_2))) a_3 i_1 = t_3 ∧ (0 : ℤ) ≤ i_4 ∧ x_4 < x_3 ∧ (2 : ℤ) + i_4 ≤ i_1 ∧ Axiomatic.p_isheap t_3 a i_1 ∧ Axiomatic1.p_multisetadd t_3 t_2 a i_1 x_4 ∧ Axiomatic1.p_multisetminus t_3 t_2 a i_1 x_3 ∧ Axiomatic1.p_multisetretainrest_3' t_3 t_2 a i_1 x_3 x_4 ∧ (i_4 ≤ (0 : ℤ) ∨ x_3 ≤ t_3 a_6 ∧ Memory.valid_rd t a_6 (1 : ℤ)) else x_1 = i_4) → Memory.included a_4 (1 : ℤ) a_3 i_1
  := sorry
end push_heap_Why3_ide_VCpush_heap_assign_normal_part6_goal26
