import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.replace.lib.lean.Compound.Compound
import frama_c.standard_algorithms.replace.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace replace_Why3_ide_VCreplace_assert_rte_mem_access_2_goal8
theorem goal8 (a : Memory.addr) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let a_1 : Memory.addr := Memory.shift a i_2; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 i_1; let a_4 : ℤ := a_3 a_1; i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rw t a_2 i_1 → Cint.is_sint32 a_4 → Axiomatic.p_unchanged_1' a_3 t_2 a i_2 i_1 → Axiomatic.p_replace_2' a_3 t_2 a i_2 a_4 i → Memory.valid_rw t a_1 (1 : ℤ)
  := sorry
end replace_Why3_ide_VCreplace_assert_rte_mem_access_2_goal8
