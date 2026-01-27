import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace linked_n_merge_segment_Why3_ide_VClinked_n_merge_segment_assert_rte_mem_access_2_goal12
theorem goal12 (i_1 : ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> Memory.addr) (a_3 : Memory.addr) (i_3 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := i_1 + i_2; let x_1 : ℤ := Cint.to_sint32 x; let a_4 : Memory.addr := t_1 (Memory.shift (t_1 (Memory.shift a_3 (i_1 + i_3 - (1 : ℤ)))) (0 : ℤ)); let x_2 : ℤ := i_1 + i_3; ¬i_2 = (0 : ℤ) → (0 : ℤ) < i_3 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_2 → i_3 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_3 → -(2147483648 : ℤ) ≤ x → x ≤ (2147483647 : ℤ) → -(2147483647 : ℤ) ≤ x_1 → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Memory.valid_rw t (Memory.shift a_3 (0 : ℤ)) (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a a_3 i_1 i_2 a_2 → Axiomatic.p_linked_n t t_1 a_2 a_3 x i a_1 → Memory.valid_rd t (Memory.shift a_3 (Cint.to_sint32 (x_1 - (1 : ℤ)))) (1 : ℤ) → Axiomatic.p_linked_n t t_1 a a_3 i_1 i_3 a_4 → Axiomatic.p_linked_n t t_1 a_4 a_3 x_2 (i + i_2 - i_3) a_1 → Memory.valid_rd t (Memory.shift a_3 (Cint.to_sint32 (Cint.to_sint32 x_2 - (2 : ℤ)))) (1 : ℤ)
  := sorry
end linked_n_merge_segment_Why3_ide_VClinked_n_merge_segment_assert_rte_mem_access_2_goal12
