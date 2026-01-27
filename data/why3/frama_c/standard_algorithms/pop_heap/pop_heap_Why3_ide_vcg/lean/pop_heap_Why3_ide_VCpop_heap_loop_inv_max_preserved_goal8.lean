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
namespace pop_heap_Why3_ide_VCpop_heap_loop_inv_max_preserved_goal8
theorem goal8 (i_2 : ℤ) (i : ℤ) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Axiomatic.l_heapparent i_2; let x_1 : ℤ := i - (1 : ℤ); let a_1 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_2 a_1; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x_3 : ℤ := t_2 a_2; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 x_1; let a_4 : ℤ := a_3 a_1; let a_5 : Memory.addr := Memory.shift a i_2; let a_6 : ℤ := a_3 a_5; let a_7 : ℤ := a_3 (Memory.shift a (Axiomatic.l_heapparent x)); let a_8 : Memory.addr := Memory.shift a x; let a_9 : Memory.addr -> ℤ := Function.update a_3 a_8 a_6; (0 : ℤ) < i → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_3 → (0 : ℤ) ≤ x → x < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_2 < x_3 → a_4 < a_6 → a_4 < a_7 → (2 : ℤ) ≤ i → (2 : ℤ) + i_2 ≤ i → (2 : ℤ) + x ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 x → Axiomatic.p_isheap t_2 a i → Cint.is_sint32 x_3 → Axiomatic1.p_heapmaximumchild t_2 a i (0 : ℤ) i_1 → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_5 (1 : ℤ) → Memory.valid_rw t a_2 i → Cint.is_sint32 (t_2 (Memory.shift a (Axiomatic.l_heapparent (0 : ℤ)))) → Memory.valid_rw t a_8 (1 : ℤ) → Cint.is_sint32 x_2 → Cint.is_sint32 a_6 → Cint.is_sint32 a_4 → Cint.is_sint32 a_7 → Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x_1)) (1 : ℤ) → Axiomatic.p_isheap a_3 a i → Cint.is_sint32 (a_9 a_1) → Axiomatic.p_isheap a_9 a i → Axiomatic.p_upperbound_1' a_3 a (0 : ℤ) i x_3 → Axiomatic1.p_heapmaximumchild a_3 a i x i_2 → Axiomatic1.p_heapmaximumchild a_9 a i i_2 i_3 → ((2 : ℤ) + i_1 ≤ i → Axiomatic.l_heapparent i_1 = (0 : ℤ)) → ((2 : ℤ) + i_3 ≤ i → Axiomatic.l_heapparent i_3 = i_2) → Axiomatic.p_upperbound_1' a_9 a (0 : ℤ) i x_3
  := sorry
end pop_heap_Why3_ide_VCpop_heap_loop_inv_max_preserved_goal8
