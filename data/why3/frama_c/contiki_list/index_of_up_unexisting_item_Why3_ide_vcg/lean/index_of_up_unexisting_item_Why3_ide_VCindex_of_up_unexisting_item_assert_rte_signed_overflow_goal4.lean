import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace index_of_up_unexisting_item_Why3_ide_VCindex_of_up_unexisting_item_assert_rte_signed_overflow_goal4
theorem goal4 (t : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (fact0 : A_Index_of_item.l_index_of t a a_1 i_2 i = i) (fact1 : i_1 ≤ i) (fact2 : i_2 ≤ i) (fact3 : i_1 < i) (fact4 : i_2 ≤ i_1) (fact5 : (0 : ℤ) ≤ i_2) (fact6 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact7 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact8 : Memory.framed t) (fact9 : Cint.is_sint32 i) (fact10 : Cint.is_sint32 i_1) (fact11 : Cint.is_sint32 i_2) (fact12 : ∀(i_3 : ℤ), i_3 < i_1 → i_2 ≤ i_3 → ¬t (Memory.shift a_1 i_3) = a) (fact13 : ∀(i_3 : ℤ), i_3 < i_1 → i_2 ≤ i_3 → A_Index_of_item.l_index_of t a a_1 i_1 i = i) : i_1 ≤ (2147483646 : ℤ)
  := sorry
end index_of_up_unexisting_item_Why3_ide_VCindex_of_up_unexisting_item_assert_rte_signed_overflow_goal4
