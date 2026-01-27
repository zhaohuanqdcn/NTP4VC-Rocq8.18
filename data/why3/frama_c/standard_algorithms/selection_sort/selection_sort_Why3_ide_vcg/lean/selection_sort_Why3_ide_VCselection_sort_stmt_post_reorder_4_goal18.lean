import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.selection_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.selection_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace selection_sort_Why3_ide_VCselection_sort_stmt_post_reorder_4_goal18
theorem goal18 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (i_1 : ℤ) (i_3 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_2; let x_1 : ℤ := i_1 - i_3; let a_3 : Memory.addr := Memory.shift a x_1; let a_4 : Memory.addr := Memory.shift a i_1; let a_5 : ℤ := a_2 a_3; let a_6 : Memory.addr -> ℤ := Function.update (Function.update a_2 a_3 i) a_4 a_5; let a_7 : ℤ := a_6 a_3; let a_8 : ℤ := a_2 a_4; let x_2 : ℤ := i_2 + i_3; let x_3 : ℤ := i_2 + i_3 - i_1; let a_9 : ℤ := a_2 (Memory.shift a (i_1 - (1 : ℤ) - i_3)); a_7 = a_8 → (0 : ℤ) ≤ i_1 → i_1 < i_2 → i_3 ≤ i_1 → i_1 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_1 < x_2 → i_1 ≤ x_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_1 ≤ (4294967295 : ℤ) → x_2 ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 x_1 → Memory.valid_rw t a_1 i_2 → Memory.valid_rw t a_4 (1 : ℤ) → Memory.valid_rd t a_3 x_3 → Memory.valid_rw t a_3 (1 : ℤ) → Cint.is_sint32 a_8 → Cint.is_sint32 a_5 → Cint.is_sint32 a_9 → Axiomatic1.p_sorted_1' a_2 a (0 : ℤ) x_1 → Cint.is_sint32 a_7 → Axiomatic1.p_multisetunchanged_1' a_2 t_2 a (0 : ℤ) i_2 → Axiomatic1.p_minelement a_2 a_3 x_3 i_3 → Axiomatic1.p_strictlowerbound_1' a_2 a_3 (0 : ℤ) i_3 a_8 → (i_3 < i_1 → Axiomatic1.p_lowerbound_1' a_2 a x_1 i_2 a_9) → Axiomatic.p_unchanged_1' a_6 a_2 a ((1 : ℤ) + i_1 - i_3) i_1
  := sorry
end selection_sort_Why3_ide_VCselection_sort_stmt_post_reorder_4_goal18
