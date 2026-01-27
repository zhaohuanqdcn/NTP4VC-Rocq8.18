import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.is_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_heap.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace is_heap_Why3_ide_VCis_heap_post_heap_goal0
theorem goal0 (i_2 : ℤ) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := Axiomatic.l_heapparent i_2; let a_1 : Memory.addr := Memory.shift a x; let a_2 : Memory.addr := Memory.shift a i_2; (0 : ℤ) ≤ x → x < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (1 : ℤ) + i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_sint32 i_1 → Cint.is_uint32 x → Axiomatic.p_isheap t_1 a i_2 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → (if i_2 < i then i_1 = (0 : ℤ) ∧ t_1 a_1 < t_1 a_2 ∧ Memory.valid_rd t a_2 (1 : ℤ) ∧ Memory.valid_rd t a_1 (1 : ℤ) else i_1 = (1 : ℤ)) → Axiomatic.p_isheap t_1 a i = (¬i_1 = (0 : ℤ))
  := sorry
end is_heap_Why3_ide_VCis_heap_post_heap_goal0
