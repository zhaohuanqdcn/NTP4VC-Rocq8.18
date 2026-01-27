import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
open Classical
open Lean4Why3
namespace index_of_not_in_subrange_Why3_ide_VCindex_of_not_in_subrange_loop_inv_3_preserved_goal4
theorem goal4 (i_2 : ℤ) (t : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i_4 : ℤ) (i : ℤ) (i_1 : ℤ) (i_3 : ℤ) : let x : ℤ := (1 : ℤ) + i_2; let x_1 : ℤ := A_Index_of_item.l_index_of t a a_1 i_4 i; ¬t (Memory.shift a_1 i_2) = a → (0 : ℤ) ≤ i → i_2 ≤ i_1 → i_4 ≤ i_1 → i_2 < i_1 → i_3 ≤ i_2 → i_4 ≤ i_2 → i_4 ≤ i_3 → (0 : ℤ) ≤ i_4 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cint.is_sint32 i_4 → Cint.is_sint32 x → (∀(i_5 : ℤ), i_5 < i_1 → i_4 ≤ i_5 → ¬t (Memory.shift a_1 i_5) = a) → (∀(i_5 : ℤ), i_5 < i_2 → i_4 ≤ i_5 → x_1 = A_Index_of_item.l_index_of t a a_1 i_2 i) → A_Index_of_item.l_index_of t a a_1 x i = x_1
  := sorry
end index_of_not_in_subrange_Why3_ide_VCindex_of_not_in_subrange_loop_inv_3_preserved_goal4
