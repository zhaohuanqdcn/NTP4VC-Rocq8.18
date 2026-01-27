import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.replace_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.replace_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace replace_copy_Why3_ide_VCreplace_copy_assert_rte_mem_access_goal7
theorem goal7 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i_2; i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_3 < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rd t a_2 i_2 → Memory.valid_rw t a_3 i_2 → Memory.separated a_2 i_2 a (1 : ℤ) → Axiomatic.p_unchanged_1' a_4 t_2 a_1 i_3 i_2 → Axiomatic.p_replace_1' a_4 t_2 a_1 i_3 a i_1 i → Memory.valid_rd t (Memory.shift a_1 i_3) (1 : ℤ)
  := sorry
end replace_copy_Why3_ide_VCreplace_copy_assert_rte_mem_access_goal7
