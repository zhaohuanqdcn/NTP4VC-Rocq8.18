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
namespace partial_sort_Why3_ide_VCpartial_sort_loop_inv_upper_established_goal10
theorem goal10 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_1; let a_3 : ℤ := a_2 a_1; (0 : ℤ) < i_1 → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_1 i → Memory.valid_rw t a_1 i_1 → Cint.is_sint32 a_3 → Axiomatic1.p_isheap a_2 a i_1 → Axiomatic1.p_multisetunchanged_1' a_2 t_2 a (0 : ℤ) i_1 → Axiomatic1.p_upperbound_1' a_2 a (0 : ℤ) i_1 a_3
  := sorry
end partial_sort_Why3_ide_VCpartial_sort_loop_inv_upper_established_goal10
