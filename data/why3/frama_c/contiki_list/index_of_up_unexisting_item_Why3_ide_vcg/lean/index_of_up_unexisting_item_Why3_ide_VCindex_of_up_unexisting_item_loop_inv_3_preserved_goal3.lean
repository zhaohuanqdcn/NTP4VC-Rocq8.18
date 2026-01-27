import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace index_of_up_unexisting_item_Why3_ide_VCindex_of_up_unexisting_item_loop_inv_3_preserved_goal3
theorem goal3 (i_1 : ℤ) (t : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i_3 : ℤ) (i : ℤ) (i_2 : ℤ) : let x : ℤ := (1 : ℤ) + i_1; A_Index_of_item.l_index_of t a a_1 i_3 i = i → i_1 ≤ i → i_3 ≤ i → i_1 < i → i_2 ≤ i_1 → i_3 ≤ i_1 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cint.is_sint32 x → (∀(i_4 : ℤ), i_4 < i_1 → i_3 ≤ i_4 → ¬t (Memory.shift a_1 i_4) = a) → (∀(i_4 : ℤ), i_4 < i_1 → i_3 ≤ i_4 → A_Index_of_item.l_index_of t a a_1 i_1 i = i) → A_Index_of_item.l_index_of t a a_1 x i = i
  := sorry
end index_of_up_unexisting_item_Why3_ide_VCindex_of_up_unexisting_item_loop_inv_3_preserved_goal3
