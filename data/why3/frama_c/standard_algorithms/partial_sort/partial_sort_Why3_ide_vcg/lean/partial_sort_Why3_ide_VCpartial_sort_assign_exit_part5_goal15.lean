import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
open Classical
open Lean4Why3
namespace partial_sort_Why3_ide_VCpartial_sort_assign_exit_part5_goal15
theorem goal15 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_4 : Memory.addr -> ℤ) (i_3 : ℤ) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (t_3 : Memory.addr -> ℤ) (i_4 : ℤ) (t_5 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) (i : ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_4 a_1 i_3; let a_3 : Memory.addr -> ℤ := Memory.havoc t_2 a_2 a_1 i_2; let a_4 : Memory.addr -> ℤ := Memory.havoc t_3 a_3 a_1 i_3; let x : ℤ := i_3 - (1 : ℤ); let a_5 : Memory.addr := Memory.shift a x; let a_6 : ℤ := a_4 a_5; let a_7 : ℤ := a_3 a_1; let a_8 : Memory.addr := Memory.shift a i_4; let a_9 : ℤ := a_3 a_8; let x_1 : ℤ := t_5 a_8; let x_2 : ℤ := t_5 a_5; a_6 = a_7 → (0 : ℤ) < i_3 → i_3 ≤ i_2 → i_4 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_4 < i_2 → i_3 ≤ i_4 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → a_9 < a_7 → Memory.linked t → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_sint32 i_1 → Cint.is_sint32 x_1 → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_8 (1 : ℤ) → Memory.valid_rw t a_1 i_2 → Memory.valid_rw t a_1 i_3 → Cint.is_sint32 x_2 → Cint.is_sint32 (a_2 a_1) → Axiomatic1.p_isheap a_2 a i_3 → Axiomatic1.p_multisetunchanged_1' a_2 t_4 a (0 : ℤ) i_3 → Cint.is_sint32 a_7 → Cint.is_sint32 a_9 → Axiomatic1.p_isheap a_3 a i_3 → Axiomatic1.p_multisetunchanged_1' a_3 t_4 a (0 : ℤ) i_4 → Axiomatic.p_unchanged_1' a_3 t_4 a i_4 i_2 → Axiomatic1.p_upperbound_1' a_3 a (0 : ℤ) i_3 a_7 → Axiomatic1.p_lowerbound_1' a_3 a i_3 i_4 a_7 → Cint.is_sint32 a_6 → Axiomatic1.p_isheap a_4 a x → Axiomatic1.p_multisetunchanged_1' a_4 t_4 a (0 : ℤ) ((1 : ℤ) + i_4) → Axiomatic1.p_multisetunchanged_1' a_4 a_3 a (0 : ℤ) i_3 → Axiomatic1.p_maxelement a_4 a i_3 x → Memory.valid_rw t a_8 (1 : ℤ) ∧ Memory.valid_rw t a_5 (1 : ℤ) ∨ Function.update (Function.update t_5 a_8 i) a_5 x_1 a_8 = x_2 ∧ a_4 = t_5 ∧ Memory.valid_rw t a_8 (1 : ℤ) ∧ Memory.valid_rw t a_5 (1 : ℤ) → (¬Memory.invalid t a_8 (1 : ℤ) → Memory.included a_8 (1 : ℤ) a_1 i_2) ∧ (¬Memory.invalid t a_5 (1 : ℤ) → Memory.included a_5 (1 : ℤ) a_1 i_2)
  := sorry
end partial_sort_Why3_ide_VCpartial_sort_assign_exit_part5_goal15
