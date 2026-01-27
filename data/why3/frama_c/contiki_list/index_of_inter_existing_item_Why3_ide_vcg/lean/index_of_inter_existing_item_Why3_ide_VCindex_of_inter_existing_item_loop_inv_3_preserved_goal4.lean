import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace index_of_inter_existing_item_Why3_ide_VCindex_of_inter_existing_item_loop_inv_3_preserved_goal4
theorem goal4 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Index_of_item.l_index_of t_1 a a_1 i_3 i; let x_1 : ℤ := (1 : ℤ) + i_1; ¬t_1 (Memory.shift a_1 i_1) = a → i_1 ≤ i → i_3 ≤ i → i_1 < i → i_2 ≤ i_1 → i_3 ≤ i_1 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x < i → i_3 ≤ x → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cint.is_sint32 x_1 → Memory.valid_rw t (Memory.shift a_1 i_3) (i - i_3) → (∀(i_4 : ℤ), i_4 < i_1 → i_3 ≤ i_4 → ¬t_1 (Memory.shift a_1 i_4) = a) → (∀(i_4 : ℤ), i_4 < i_1 → i_3 ≤ i_4 → x = A_Index_of_item.l_index_of t_1 a a_1 i_1 i) → A_Index_of_item.l_index_of t_1 a a_1 x_1 i = x
  := sorry
end index_of_inter_existing_item_Why3_ide_VCindex_of_inter_existing_item_loop_inv_3_preserved_goal4
