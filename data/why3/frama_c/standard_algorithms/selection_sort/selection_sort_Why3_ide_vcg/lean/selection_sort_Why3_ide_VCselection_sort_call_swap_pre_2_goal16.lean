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
namespace selection_sort_Why3_ide_VCselection_sort_call_swap_pre_2_goal16
theorem goal16 (i : ℤ) (i_2 : ℤ) (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x_1 : ℤ := i - i_2; let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a i_2; let x_2 : ℤ := i_1 - i_2; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_1; let a_4 : ℤ := a_3 (Memory.shift a i); let a_5 : ℤ := a_3 (Memory.shift a (i_2 - (1 : ℤ))); (0 : ℤ) ≤ i → i < i_1 → i_2 ≤ i → i ≤ i_1 → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (4294967295 : ℤ) → i_1 ≤ (4294967295 : ℤ) + i_2 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 x_1 → Cint.is_sint32 (t_2 (Memory.shift a (-(1 : ℤ)))) → Memory.valid_rw t a_1 i_1 → Memory.valid_rd t a_2 x_2 → Cint.is_sint32 a_4 → Cint.is_sint32 a_5 → Axiomatic1.p_sorted_1' a_3 a (0 : ℤ) i_2 → Axiomatic1.p_multisetunchanged_1' a_3 t_2 a (0 : ℤ) i_1 → Axiomatic1.p_minelement a_3 a_2 x_2 x_1 → Axiomatic1.p_strictlowerbound_1' a_3 a_2 (0 : ℤ) x_1 a_4 → ((0 : ℤ) < i_2 → Axiomatic1.p_lowerbound_1' a_3 a i_2 i_1 a_5) → Memory.valid_rw t a_2 (1 : ℤ)
  := sorry
end selection_sort_Why3_ide_VCselection_sort_call_swap_pre_2_goal16
