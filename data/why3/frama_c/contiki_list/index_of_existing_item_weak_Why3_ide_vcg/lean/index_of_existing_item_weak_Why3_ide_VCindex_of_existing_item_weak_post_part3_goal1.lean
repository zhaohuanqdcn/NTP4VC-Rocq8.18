import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace index_of_existing_item_weak_Why3_ide_VCindex_of_existing_item_weak_post_part3_goal1
theorem goal1 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (i_2 : ℤ) (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := t_1 (Memory.shift a i_2); let x : ℤ := A_Index_of_item.l_index_of t_1 a_1 a i_3 i; a_1 = t_1 (Memory.shift a i_1) → ¬x = i → (0 : ℤ) ≤ i → i_1 < i → i_3 ≤ i_1 → i_2 < i → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Memory.valid_rw t (Memory.shift a i_3) (i - i_3) → Cint.is_sint32 x → (i_3 ≤ i → x ≤ i ∧ i_3 ≤ x) → (x < i → t_1 (Memory.shift a x) = a_1) → i_3 ≤ x
  := sorry
end index_of_existing_item_weak_Why3_ide_VCindex_of_existing_item_weak_post_part3_goal1
