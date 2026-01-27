import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace index_of_up_unexisting_item_Why3_ide_VCindex_of_up_unexisting_item_loop_inv_2_preserved_goal2
theorem goal2 (t : Memory.addr -> Memory.addr) (a : Memory.addr) (i_2 : ℤ) (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) : let a_1 : Memory.addr := t (Memory.shift a i_2); A_Index_of_item.l_index_of t a_1 a i_3 i = i → i_1 ≤ i → i_3 ≤ i → i_1 < i → i_2 ≤ i_1 → i_3 ≤ i_1 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cint.is_sint32 ((1 : ℤ) + i_1) → (∀(i_4 : ℤ), i_4 < i_1 → i_3 ≤ i_4 → ¬a_1 = t (Memory.shift a i_4)) → ¬(∀(i_4 : ℤ), i_4 < i_1 → i_3 ≤ i_4 → A_Index_of_item.l_index_of t a_1 a i_1 i = i)
  := sorry
end index_of_up_unexisting_item_Why3_ide_VCindex_of_up_unexisting_item_loop_inv_2_preserved_goal2
