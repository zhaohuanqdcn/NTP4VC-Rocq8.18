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
namespace partial_sort_Why3_ide_VCpartial_sort_stmt_post_goal25
theorem goal25 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_4 : Memory.addr -> ℤ) (i_1 : ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t_3 : Memory.addr -> ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_4 a_1 i_1; let a_3 : Memory.addr -> ℤ := Memory.havoc t_2 a_2 a_1 i; let a_4 : Memory.addr -> ℤ := Memory.havoc t_3 a_3 a_1 i_1; let x : ℤ := i_1 - (1 : ℤ); let a_5 : ℤ := a_4 (Memory.shift a x); let a_6 : ℤ := a_3 a_1; let a_7 : Memory.addr := Memory.shift a i_2; let a_8 : ℤ := a_3 a_7; a_5 = a_6 → (0 : ℤ) < i_1 → i_1 ≤ i → i_2 ≤ i → (0 : ℤ) ≤ i_1 → i_2 < i → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → a_8 < a_6 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_7 (1 : ℤ) → Memory.valid_rw t a_1 i → Memory.valid_rw t a_1 i_1 → Axiomatic1.p_isheap a_2 a i_1 → Axiomatic1.p_multisetunchanged_1' a_2 t_4 a (0 : ℤ) i_1 → Cint.is_sint32 a_6 → Cint.is_sint32 a_8 → Axiomatic1.p_isheap a_3 a i_1 → Axiomatic1.p_multisetunchanged_1' a_3 t_4 a (0 : ℤ) i_2 → Axiomatic.p_unchanged_1' a_3 t_4 a i_2 i → Axiomatic1.p_upperbound_1' a_3 a (0 : ℤ) i_1 a_6 → Axiomatic1.p_lowerbound_1' a_3 a i_1 i_2 a_6 → Cint.is_sint32 a_5 → Axiomatic1.p_isheap a_4 a x → Axiomatic1.p_multisetunchanged_1' a_4 a_3 a (0 : ℤ) i_1 → Axiomatic1.p_maxelement a_4 a i_1 x → Axiomatic1.p_multisetunchanged_1' a_4 t_4 a (0 : ℤ) ((1 : ℤ) + i_2)
  := sorry
end partial_sort_Why3_ide_VCpartial_sort_stmt_post_goal25
