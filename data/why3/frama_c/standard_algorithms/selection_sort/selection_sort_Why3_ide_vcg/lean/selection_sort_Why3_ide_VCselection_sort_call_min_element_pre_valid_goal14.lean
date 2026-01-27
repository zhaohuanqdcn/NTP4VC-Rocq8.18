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
namespace selection_sort_Why3_ide_VCselection_sort_call_min_element_pre_valid_goal14
theorem goal14 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i; let a_3 : ℤ := a_2 (Memory.shift a (i_1 - (1 : ℤ))); i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 (t_2 (Memory.shift a (-(1 : ℤ)))) → Memory.valid_rw t a_1 i → Cint.is_sint32 a_3 → Axiomatic1.p_sorted_1' a_2 a (0 : ℤ) i_1 → Axiomatic1.p_multisetunchanged_1' a_2 t_2 a (0 : ℤ) i → ((0 : ℤ) < i_1 → Axiomatic1.p_lowerbound_1' a_2 a i_1 i a_3) → Memory.valid_rd t (Memory.shift a i_1) (i - i_1)
  := sorry
end selection_sort_Why3_ide_VCselection_sort_call_min_element_pre_valid_goal14
