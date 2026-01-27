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
namespace pop_heap_Why3_ide_VCpop_heap_loop_inv_heap_2_established_goal7
theorem goal7 (i : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) : let x_1 : ℤ := i - (1 : ℤ); let x_2 : ℤ := t_1 (Memory.shift a x_1); let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x_3 : ℤ := t_1 a_1; let x_4 : ℤ := t_1 (Memory.shift a (Axiomatic.l_heapparent (0 : ℤ))); (0 : ℤ) < i → (0 : ℤ) < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_2 < x_3 → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_isheap t_1 a i → Cint.is_sint32 x_3 → Axiomatic1.p_heapmaximumchild t_1 a i (0 : ℤ) i_1 → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rw t a_1 i → Cint.is_sint32 x_4 → Cint.is_sint32 x_2 → Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x_1)) (1 : ℤ) → ((2 : ℤ) + i_1 ≤ i → Axiomatic.l_heapparent i_1 = (0 : ℤ)) → x_2 < x_4
  := sorry
end pop_heap_Why3_ide_VCpop_heap_loop_inv_heap_2_established_goal7
