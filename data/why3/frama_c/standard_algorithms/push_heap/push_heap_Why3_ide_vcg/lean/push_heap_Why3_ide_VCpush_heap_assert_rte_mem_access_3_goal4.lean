import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.push_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.push_heap.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace push_heap_Why3_ide_VCpush_heap_assert_rte_mem_access_3_goal4
theorem goal4 (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := i - (1 : ℤ); let x_1 : ℤ := Axiomatic.l_heapparent x; let a_1 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_1 a_1; let x_3 : ℤ := t_1 (Memory.shift a x); let a_2 : Memory.addr := Memory.shift a (Cint.to_uint32 x); (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_2 < x_3 → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Cint.is_uint32 x_1 → Axiomatic.p_isheap t_1 a x → Cint.is_sint32 x_3 → Cint.is_sint32 x_2 → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ)
  := sorry
end push_heap_Why3_ide_VCpush_heap_assert_rte_mem_access_3_goal4
