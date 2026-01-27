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
namespace pop_heap_Why3_ide_VCpop_heap_post_result_goal1
theorem goal1 (a : Memory.addr) (t_5 : Memory.addr -> ℤ) (i : ℤ) (t_4 : Memory.addr -> ℤ) (i_1 : ℤ) (t_3 : Memory.addr -> ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) (p : Bool) (p_1 : Bool) (t_1 : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_5 a_1; let x_1 : ℤ := i - (1 : ℤ); let a_2 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_4 a_2; let a_3 : Memory.addr := Memory.shift a (Cint.to_uint32 x_1); let a_4 : Memory.addr := Memory.shift a i_1; let x_3 : ℤ := t_3 a_2; let a_5 : Memory.addr := Memory.shift a i_3; (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Axiomatic.p_isheap t_5 a i → Cint.is_sint32 x → Memory.valid_rw t a_1 i → Cint.is_sint32 x_2 → (if (2 : ℤ) ≤ i then Memory.valid_rd t a_1 (1 : ℤ) ∧ Memory.valid_rd t a_3 (1 : ℤ) ∧ (if t_5 a_2 < x then p = false ∧ p_1 = false ∧ t_1 = t ∧ Memory.havoc t_2 t_5 a_1 x_1 = t_3 ∧ Function.update (Function.update t_3 a_4 x_3) a_2 x = t_4 ∧ (0 : ℤ) < i_2 ∧ (0 : ℤ) ≤ i_1 ∧ i_1 < i_3 ∧ x_3 < t_3 (Memory.shift a (Axiomatic.l_heapparent i_1)) ∧ (2 : ℤ) + i_1 ≤ i ∧ Axiomatic.p_isheap t_3 a i ∧ Axiomatic1.p_heapmaximumchild t_3 a i i_1 i_3 ∧ Axiomatic1.p_heapmaximumchild t_5 a i (0 : ℤ) i_2 ∧ Memory.valid_rw t_1 a_1 i ∧ Memory.valid_rw t_1 a_4 (1 : ℤ) ∧ Axiomatic.p_upperbound_1' t_3 a (0 : ℤ) i x ∧ Memory.valid_rd t_1 a_3 (1 : ℤ) ∧ Memory.valid_rw t_1 a_3 (1 : ℤ) ∧ ((2 : ℤ) + i_2 ≤ i → Axiomatic.l_heapparent i_2 = (0 : ℤ)) ∧ ((2 : ℤ) + i_3 ≤ i → Axiomatic.l_heapparent i_3 = i_1) ∧ (i ≤ (1 : ℤ) + i_3 ∨ t_3 a_5 ≤ x_3 ∧ Memory.valid_rd t_1 a_5 (1 : ℤ)) else t_5 = t_4) else t_5 = t_4) → x_2 = x
  := sorry
end pop_heap_Why3_ide_VCpop_heap_post_result_goal1
