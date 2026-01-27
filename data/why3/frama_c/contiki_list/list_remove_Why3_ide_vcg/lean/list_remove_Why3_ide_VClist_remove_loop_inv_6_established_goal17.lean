import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
open Classical
open Lean4Why3
namespace list_remove_Why3_ide_VClist_remove_loop_inv_6_established_goal17
theorem goal17 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := t_1 a; let a_3 : Memory.addr := t_1 (Memory.shift a_1 i_2); let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := i + i_2; ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = a_2 → (0 : ℤ) ≤ i → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → i ≤ (2147483645 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_2 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_4 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_4 (2147483646 : ℤ) → Memory.separated a_2 (4 : ℤ) a_4 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a_2 a_1 i_2 i (Memory.addr.mk (0 : ℤ) (0 : ℤ)) → Cint.is_sint32 (A_Index_of_item.l_index_of t_1 a_3 a_1 i_2 x) → (∀(i_3 : ℤ), i_2 ≤ i_3 → i_3 < x → Memory.separated a (1 : ℤ) (t_1 (Memory.shift a_1 i_3)) (4 : ℤ)) → (∀(i_3 : ℤ), i_2 ≤ i_3 → i_3 < x → Memory.separated (t_1 (Memory.shift a_1 i_3)) (4 : ℤ) a_4 (2147483646 : ℤ)) → (∀(i_3 : ℤ), let a_5 : Memory.addr := t_1 (Memory.shift a_1 i_3); ¬a_3 = a_5 → i_2 ≤ i_3 → i_3 < x → Memory.separated a_3 (4 : ℤ) a_5 (4 : ℤ)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_2 ≤ i_3 → i_2 ≤ i_4 → i_3 < x → i_4 < x → ¬t_1 (Memory.shift a_1 i_4) = t_1 (Memory.shift a_1 i_3)) → ¬(∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_2 ≤ i_3 → i_2 ≤ i_4 → i_3 < x → i_4 < x → Memory.separated (t_1 (Memory.shift a_1 i_4)) (4 : ℤ) (t_1 (Memory.shift a_1 i_3)) (4 : ℤ))
  := sorry
end list_remove_Why3_ide_VClist_remove_loop_inv_6_established_goal17
