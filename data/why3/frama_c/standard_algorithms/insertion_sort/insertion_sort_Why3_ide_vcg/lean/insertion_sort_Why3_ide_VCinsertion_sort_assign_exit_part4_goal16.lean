import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.insertion_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.insertion_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.insertion_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.insertion_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace insertion_sort_Why3_ide_VCinsertion_sort_assign_exit_part4_goal16
theorem goal16 (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a i_2; let a_3 : Memory.addr := Memory.shift a i_1; let x_1 : ℤ := (1 : ℤ) + i_2 - i_1; let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i; let a_5 : ℤ := a_4 a_2; i_2 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (4294967295 : ℤ) + i_1 → Cint.to_uint32 (i_2 - i_1) ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Memory.valid_rd t a_1 i_2 → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rw t a_1 i → Memory.valid_rw t a_3 x_1 → ¬Memory.invalid t a_3 x_1 → Cint.is_sint32 a_5 → Axiomatic1.p_sorted_1' a_4 a (0 : ℤ) i_2 → Axiomatic.p_unchanged_1' a_4 t_2 a i_2 i → Axiomatic1.p_multisetunchanged_1' a_4 t_2 a (0 : ℤ) i_2 → Axiomatic1.p_upperbound_1' a_4 a (0 : ℤ) i_1 a_5 → Axiomatic1.p_strictlowerbound_1' a_4 a i_1 i_2 a_5 → Memory.included a_3 x_1 a_1 i
  := sorry
end insertion_sort_Why3_ide_VCinsertion_sort_assign_exit_part4_goal16
