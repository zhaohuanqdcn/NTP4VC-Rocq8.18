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
namespace make_heap_Why3_ide_VCmake_heap_assert_rte_unsigned_overflow_goal7
theorem goal7 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i; let x : ℤ := (1 : ℤ) + i_1; (0 : ℤ) < i → (0 : ℤ) < i_1 → i_1 ≤ i → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_1 i → Axiomatic.p_isheap a_2 a i_1 → Axiomatic1.p_multisetunchanged_1' a_2 t_2 a (0 : ℤ) x → Axiomatic.p_unchanged_1' a_2 t_2 a x i → i_1 ≤ (4294967294 : ℤ)
  := sorry
end make_heap_Why3_ide_VCmake_heap_assert_rte_unsigned_overflow_goal7
