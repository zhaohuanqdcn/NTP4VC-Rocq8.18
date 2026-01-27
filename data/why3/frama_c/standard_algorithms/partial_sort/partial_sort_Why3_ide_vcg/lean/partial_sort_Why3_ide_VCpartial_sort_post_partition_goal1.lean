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
namespace partial_sort_Why3_ide_VCpartial_sort_post_partition_goal1
theorem goal1 (a : Memory.addr) (t_6 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_5 : Memory.addr -> ℤ) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (p : Bool) (t_1 : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (t_8 : Memory.addr -> ℤ) (t_4 : Memory.addr -> ℤ) (t_7 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_6 a_1; let a_2 : Memory.addr -> ℤ := Memory.havoc t_3 t_5 a_1 i_2; i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 (t_5 a_1) → Cint.is_sint32 x → Memory.valid_rw t a_1 i → (if (0 : ℤ) < i_1 then p = false ∧ t_1 = t ∧ Memory.havoc t_2 t_8 a_1 i_1 = t_5 ∧ Memory.havoc t_3 t_5 a_1 i = t_6 ∧ Memory.havoc t_4 a_2 a_1 i_1 = t_7 ∧ i_2 ≤ i ∧ i ≤ i_2 ∧ i_1 ≤ i_2 ∧ Axiomatic.p_sorted_1' t_7 a (0 : ℤ) i_1 ∧ Axiomatic1.p_isheap t_5 a i_1 ∧ Axiomatic1.p_isheap t_6 a i_1 ∧ Axiomatic1.p_multisetunchanged_1' t_5 t_8 a (0 : ℤ) i_1 ∧ Axiomatic1.p_multisetunchanged_1' t_6 t_8 a (0 : ℤ) i_2 ∧ Axiomatic.p_unchanged_1' t_6 t_8 a i_2 i ∧ Memory.valid_rw t_1 a_1 i_1 ∧ Axiomatic1.p_upperbound_1' t_6 a (0 : ℤ) i_1 x ∧ Axiomatic1.p_lowerbound_1' t_6 a i_1 i_2 x ∧ Axiomatic1.p_multisetunchanged_1' t_7 a_2 a (0 : ℤ) i_1 else t_8 = t_7) → Axiomatic.p_partition t_7 a i_1 i
  := sorry
end partial_sort_Why3_ide_VCpartial_sort_post_partition_goal1
