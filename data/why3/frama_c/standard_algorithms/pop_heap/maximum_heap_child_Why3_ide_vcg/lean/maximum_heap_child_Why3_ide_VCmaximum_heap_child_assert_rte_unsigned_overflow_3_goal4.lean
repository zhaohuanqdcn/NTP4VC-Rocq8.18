import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.pop_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.pop_heap.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace maximum_heap_child_Why3_ide_VCmaximum_heap_child_assert_rte_unsigned_overflow_3_goal4
theorem goal4 (i : ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : (2 : ℤ) ≤ i_1) (fact3 : i ≤ (2147483646 : ℤ)) (fact4 : (2 : ℤ) + i ≤ i_1) (fact5 : Memory.linked t) (fact6 : Cint.is_uint32 i) (fact7 : Cint.is_uint32 i_1) (fact8 : Axiomatic.p_isheap t_1 a i_1) (fact9 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1) : Cint.to_uint32 ((2 : ℤ) * i) ≤ (4294967293 : ℤ)
  := sorry
end maximum_heap_child_Why3_ide_VCmaximum_heap_child_assert_rte_unsigned_overflow_3_goal4
