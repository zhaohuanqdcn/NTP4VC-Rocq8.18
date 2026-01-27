import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.max_element2.lib.lean.Compound.Compound
import frama_c.standard_algorithms.max_element2.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace max_element_Why3_ide_VCmax_element_assert_rte_mem_access_2_goal9
theorem goal9 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_1 (Memory.shift a i_1); let a_2 : Memory.addr := Memory.shift a i_2; (0 : ℤ) < i → i_2 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 (t_1 a_1) → Cint.is_sint32 x → Cint.is_sint32 (t_1 a_2) → Memory.valid_rd t a_1 i → Axiomatic.p_upperbound_1' t_1 a (0 : ℤ) i_2 x → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_1 x → Memory.valid_rd t a_2 (1 : ℤ)
  := sorry
end max_element_Why3_ide_VCmax_element_assert_rte_mem_access_2_goal9
