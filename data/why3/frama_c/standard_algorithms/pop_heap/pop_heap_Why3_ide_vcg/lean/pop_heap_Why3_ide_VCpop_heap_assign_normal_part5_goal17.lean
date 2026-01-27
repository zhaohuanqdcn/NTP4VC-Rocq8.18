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
namespace pop_heap_Why3_ide_VCpop_heap_assign_normal_part5_goal17
theorem goal17 (i : ℤ) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i_3 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) : let x : ℤ := i - (1 : ℤ); let a_1 : Memory.addr := Memory.shift a x; let x_1 : ℤ := t_2 a_1; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x_2 : ℤ := t_2 a_2; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 x; let a_4 : ℤ := a_3 a_1; let a_5 : ℤ := a_3 (Memory.shift a (Axiomatic.l_heapparent i_1)); let a_6 : Memory.addr := Memory.shift a (Cint.to_uint32 x); let a_7 : Memory.addr := Memory.shift a i_3; (0 : ℤ) < i → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i_1 → i_1 < i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_1 < x_2 → a_4 < a_5 → (2 : ℤ) ≤ i → (2 : ℤ) + i_1 ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Axiomatic.p_isheap t_2 a i → Cint.is_sint32 x_2 → Axiomatic1.p_heapmaximumchild t_2 a i (0 : ℤ) i_2 → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rw t a_2 i → Memory.valid_rw t (Memory.shift a i_1) (1 : ℤ) → Cint.is_sint32 (t_2 (Memory.shift a (Axiomatic.l_heapparent (0 : ℤ)))) → Cint.is_sint32 x_1 → ¬Memory.invalid t a_1 (1 : ℤ) → Cint.is_sint32 a_5 → Cint.is_sint32 a_4 → Memory.valid_rd t a_6 (1 : ℤ) → Memory.valid_rw t a_6 (1 : ℤ) → Axiomatic.p_isheap a_3 a i → Axiomatic.p_upperbound_1' a_3 a (0 : ℤ) i x_2 → Axiomatic1.p_heapmaximumchild a_3 a i i_1 i_3 → ((2 : ℤ) + i_2 ≤ i → Axiomatic.l_heapparent i_2 = (0 : ℤ)) → ((2 : ℤ) + i_3 ≤ i → Axiomatic.l_heapparent i_3 = i_1) → i ≤ (1 : ℤ) + i_3 ∨ a_3 = t_3 ∧ t_3 a_7 ≤ t_3 a_1 ∧ Memory.valid_rd t a_7 (1 : ℤ) → Memory.included a_1 (1 : ℤ) a_2 i
  := sorry
end pop_heap_Why3_ide_VCpop_heap_assign_normal_part5_goal17
