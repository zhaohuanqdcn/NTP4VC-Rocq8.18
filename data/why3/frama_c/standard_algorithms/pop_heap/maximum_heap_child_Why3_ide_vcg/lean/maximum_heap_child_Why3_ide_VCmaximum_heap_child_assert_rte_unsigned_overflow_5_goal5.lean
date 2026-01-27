import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.pop_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.pop_heap.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace maximum_heap_child_Why3_ide_VCmaximum_heap_child_assert_rte_unsigned_overflow_5_goal5
theorem goal5 (i : ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := (2 : ℤ) * i; let x_1 : ℤ := (2 : ℤ) + x; (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → i ≤ (2147483646 : ℤ) → i ≤ (2147483647 : ℤ) → Cint.to_uint32 x ≤ (4294967293 : ℤ) → (2 : ℤ) + i ≤ i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_isheap t_1 a i_1 → Cint.is_uint32 x_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1 → Cint.is_sint32 (t_1 (Memory.shift a x_1)) → (0 : ℤ) < i_1
  := sorry
end maximum_heap_child_Why3_ide_VCmaximum_heap_child_assert_rte_unsigned_overflow_5_goal5
