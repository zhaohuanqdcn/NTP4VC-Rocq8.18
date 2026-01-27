import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
open Classical
open Lean4Why3
namespace index_of_unexisting_item_Why3_ide_VCindex_of_unexisting_item_post_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : Memory.addr -> Memory.addr) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ i_1) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact4 : Memory.framed t) (fact5 : Cint.is_sint32 i) (fact6 : Cint.is_sint32 i_1) (fact7 : ∀(i_2 : ℤ), i_2 < i → i_1 ≤ i_2 → ¬t (Memory.shift a_1 i_2) = a) : A_Index_of_item.l_index_of t a a_1 i_1 i = i
  := sorry
end index_of_unexisting_item_Why3_ide_VCindex_of_unexisting_item_post_goal0
