import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.pop_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.pop_heap.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace pop_heap_Why3_ide_VCpop_heap_assert_rte_mem_access_2_goal5
theorem goal5 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := i - (1 : ℤ); (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint32 i → Axiomatic.p_isheap t_1 a i → Cint.is_sint32 (t_1 a_1) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rw t a_1 i → Cint.is_sint32 (t_1 (Memory.shift a x)) → Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x)) (1 : ℤ)
  := sorry
end pop_heap_Why3_ide_VCpop_heap_assert_rte_mem_access_2_goal5
