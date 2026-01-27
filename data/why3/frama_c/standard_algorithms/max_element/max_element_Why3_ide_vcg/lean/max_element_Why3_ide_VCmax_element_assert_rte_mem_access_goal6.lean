import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.max_element.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace max_element_Why3_ide_VCmax_element_assert_rte_mem_access_goal6
theorem goal6 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_1; (0 : ℤ) < i → i_2 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 x → Cint.is_sint32 (t_1 (Memory.shift a i_2)) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → t_1 (Memory.shift a i_3) < x) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_2 → t_1 (Memory.shift a i_3) ≤ x) → Memory.valid_rd t a_1 (1 : ℤ)
  := sorry
end max_element_Why3_ide_VCmax_element_assert_rte_mem_access_goal6
