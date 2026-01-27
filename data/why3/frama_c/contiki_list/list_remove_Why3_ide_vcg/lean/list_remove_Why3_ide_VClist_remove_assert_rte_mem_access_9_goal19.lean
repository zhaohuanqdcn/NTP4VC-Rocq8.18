import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
import frama_c.contiki_list.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace list_remove_Why3_ide_VClist_remove_assert_rte_mem_access_9_goal19
theorem goal19 (t_2 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (a_3 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℝ) : let a_4 : Memory.addr := t_2 a_1; let x : ℤ := i + i_1; let a_5 : Memory.addr := Memory.shift a_3 (0 : ℤ); let a_6 : Memory.addr := Memory.shift a (0 : ℤ); let a_7 : Memory.addr := t_2 a_6; ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬a_4 = a_2 → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_1 ≤ i_2 → i_2 ≤ x → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → i ≤ (2147483645 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t a_5 (2147483646 : ℤ) → Memory.separated a_1 (1 : ℤ) a_5 (2147483646 : ℤ) → Memory.separated a_4 (4 : ℤ) a_5 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_2 a_4 a_3 i_1 i (Memory.addr.mk (0 : ℤ) (0 : ℤ)) → Axiomatic1.p_unchanged t t_2 t_1 t t_2 t_1 a_3 i_1 i_2 → Cint.is_sint32 (A_Index_of_item.l_index_of t_2 a_2 a_3 i_1 x) → Axiomatic.p_linked_n t t_2 a a_3 i_2 (1 : ℤ) a_7 → Axiomatic.p_linked_n t t_2 a_4 a_3 i_1 (i_2 - i_1) a → Axiomatic.p_linked_n t t_2 a_7 a_3 ((1 : ℤ) + i_2) (i + i_1 - (1 : ℤ) - i_2) (Memory.addr.mk (0 : ℤ) (0 : ℤ)) → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 ≤ i_2 → ¬t_2 (Memory.shift a_3 i_3) = a_2) → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < x → Memory.separated a_1 (1 : ℤ) (t_2 (Memory.shift a_3 i_3)) (4 : ℤ)) → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < i_2 → Memory.separated a_2 (4 : ℤ) (t_2 (Memory.shift a_3 i_3)) (4 : ℤ)) → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < x → Memory.separated (t_2 (Memory.shift a_3 i_3)) (4 : ℤ) a_5 (2147483646 : ℤ)) → (∀(i_3 : ℤ), let a_8 : Memory.addr := t_2 (Memory.shift a_3 i_3); ¬a_8 = a_2 → i_1 ≤ i_3 → i_3 < x → Memory.separated a_2 (4 : ℤ) a_8 (4 : ℤ)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_1 ≤ i_3 → i_1 ≤ i_4 → i_3 < x → i_4 < x → ¬t_2 (Memory.shift a_3 i_4) = t_2 (Memory.shift a_3 i_3)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_1 ≤ i_3 → i_1 ≤ i_4 → i_3 < x → i_4 < x → Memory.separated (t_2 (Memory.shift a_3 i_4)) (4 : ℤ) (t_2 (Memory.shift a_3 i_3)) (4 : ℤ)) → Memory.valid_rd t a_6 (1 : ℤ)
  := sorry
end list_remove_Why3_ide_VClist_remove_assert_rte_mem_access_9_goal19
