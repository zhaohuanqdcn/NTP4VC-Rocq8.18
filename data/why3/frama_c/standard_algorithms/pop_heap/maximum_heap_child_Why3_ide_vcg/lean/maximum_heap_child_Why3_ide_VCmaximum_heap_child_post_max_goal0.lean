import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.pop_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.pop_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.pop_heap.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.pop_heap.lib.lean.A_Count.A_Count
open Classical
open Lean4Why3
namespace maximum_heap_child_Why3_ide_VCmaximum_heap_child_post_max_goal0
theorem goal0 (i : ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (p : Bool) : let x : ℤ := (2 : ℤ) * i; let x_1 : ℤ := (1 : ℤ) + x; let a_1 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := (2 : ℤ) + x; let a_2 : Memory.addr := Memory.shift a x_2; (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → (2 : ℤ) + i ≤ i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Axiomatic.p_isheap t_1 a i_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1 → (if i ≤ (2147483646 : ℤ) then (0 : ℤ) < i_1 ∧ i ≤ (2147483647 : ℤ) ∧ Cint.to_uint32 x ≤ (4294967293 : ℤ) ∧ (if (4 : ℤ) + x ≤ i_1 then p = false ∧ Memory.valid_rd t a_1 (1 : ℤ) ∧ Memory.valid_rd t a_2 (1 : ℤ) ∧ (if t_1 a_2 ≤ t_1 a_1 then x_1 = i_2 else x_2 = i_2) else x_1 = i_2) else i_2 = i_1) → Axiomatic1.p_heapmaximumchild t_1 a i_1 i i_2
  := sorry
end maximum_heap_child_Why3_ide_VCmaximum_heap_child_post_max_goal0
