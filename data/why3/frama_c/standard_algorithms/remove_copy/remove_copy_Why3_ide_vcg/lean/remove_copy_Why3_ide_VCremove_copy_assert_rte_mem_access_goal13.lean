import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.remove_copy.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.remove_copy.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.remove_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.remove_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace remove_copy_Why3_ide_VCremove_copy_assert_rte_mem_access_goal13
theorem goal13 (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i_2 : ℤ) (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Count.l_count_1' t_2 a_1 (0 : ℤ) i_2 i; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let x_1 : ℤ := i_2 - x; let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i_1; i_2 ≤ i_1 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x ≤ i_2 → (0 : ℤ) ≤ x → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Memory.valid_rd t a_2 i_1 → Memory.valid_rw t a_3 i_1 → Memory.separated a_2 i_1 a (1 : ℤ) → Cint.is_uint32 x_1 → ¬Axiomatic.p_hasvalue_1' a_4 a (0 : ℤ) x_1 i → Axiomatic.p_unchanged_1' a_4 t_2 a_1 i_2 i_1 → Axiomatic.p_unchanged_1' a_4 t_2 a x_1 i_1 → Axiomatic1.p_multisetretainrest_1' a_4 t_2 a_1 (0 : ℤ) i_2 a (0 : ℤ) x_1 i → Memory.valid_rd t (Memory.shift a_1 i_2) (1 : ℤ)
  := sorry
end remove_copy_Why3_ide_VCremove_copy_assert_rte_mem_access_goal13
