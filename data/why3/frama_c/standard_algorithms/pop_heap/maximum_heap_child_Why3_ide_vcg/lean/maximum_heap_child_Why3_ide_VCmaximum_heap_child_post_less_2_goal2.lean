import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.pop_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.pop_heap.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace maximum_heap_child_Why3_ide_VCmaximum_heap_child_post_less_2_goal2
theorem goal2 (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := (2 : ℤ) * i; let x_1 : ℤ := (2 : ℤ) + x; let a_1 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_1 a_1; let x_3 : ℤ := (1 : ℤ) + x; let a_2 : Memory.addr := Memory.shift a x_3; (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → i ≤ (2147483646 : ℤ) → i ≤ (2147483647 : ℤ) → Cint.to_uint32 x ≤ (4294967293 : ℤ) → (2 : ℤ) + i ≤ i_1 → (2 : ℤ) + i_2 ≤ i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Axiomatic.p_isheap t_1 a i_1 → Cint.is_uint32 x_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1 → Cint.is_sint32 x_2 → (if (4 : ℤ) + x ≤ i_1 then Memory.valid_rd t a_2 (1 : ℤ) ∧ Memory.valid_rd t a_1 (1 : ℤ) ∧ (if x_2 ≤ t_1 a_2 then x_3 = i_2 else x_1 = i_2) else x_3 = i_2) → Axiomatic.l_heapparent i_2 = i
  := sorry
end maximum_heap_child_Why3_ide_VCmaximum_heap_child_post_less_2_goal2
