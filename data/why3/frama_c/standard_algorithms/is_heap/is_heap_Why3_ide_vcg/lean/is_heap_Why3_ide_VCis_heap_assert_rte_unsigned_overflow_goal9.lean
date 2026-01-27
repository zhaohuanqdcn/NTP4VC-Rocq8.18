import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.is_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_heap.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace is_heap_Why3_ide_VCis_heap_assert_rte_unsigned_overflow_goal9
theorem goal9 (i_1 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Axiomatic.l_heapparent i_1; let a_1 : Memory.addr := Memory.shift a i_1; let x_1 : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a x; let x_2 : ℤ := t_1 a_2; Int.tmod i_1 (2 : ℤ) = (0 : ℤ) → i_1 < i → (0 : ℤ) ≤ x → x < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_1 ≤ x_2 → i_1 ≤ (1 : ℤ) + i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x → Axiomatic.p_isheap t_1 a i_1 → Cint.is_sint32 x_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_sint32 x_2 → Memory.valid_rd t a_2 (1 : ℤ) → x ≤ (4294967294 : ℤ)
  := sorry
end is_heap_Why3_ide_VCis_heap_assert_rte_unsigned_overflow_goal9
