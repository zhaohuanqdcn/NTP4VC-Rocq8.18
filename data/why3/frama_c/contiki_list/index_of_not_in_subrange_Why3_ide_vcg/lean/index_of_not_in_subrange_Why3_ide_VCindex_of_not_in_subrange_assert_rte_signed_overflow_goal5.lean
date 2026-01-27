import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
open Classical
open Lean4Why3
namespace index_of_not_in_subrange_Why3_ide_VCindex_of_not_in_subrange_assert_rte_signed_overflow_goal5
theorem goal5 (t : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_3 : ℤ) (fact0 : ¬t (Memory.shift a_1 i_2) = a) (fact1 : (0 : ℤ) ≤ i) (fact2 : i_2 ≤ i_1) (fact3 : i_3 ≤ i_1) (fact4 : i_2 < i_1) (fact5 : i_3 ≤ i_2) (fact6 : (0 : ℤ) ≤ i_3) (fact7 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact8 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact9 : Memory.framed t) (fact10 : Cint.is_sint32 i) (fact11 : Cint.is_sint32 i_1) (fact12 : Cint.is_sint32 i_2) (fact13 : Cint.is_sint32 i_3) (fact14 : ∀(i_4 : ℤ), i_4 < i_1 → i_3 ≤ i_4 → ¬t (Memory.shift a_1 i_4) = a) (fact15 : ∀(i_4 : ℤ), i_4 < i_2 → i_3 ≤ i_4 → A_Index_of_item.l_index_of t a a_1 i_3 i = A_Index_of_item.l_index_of t a a_1 i_2 i) : i_2 ≤ (2147483646 : ℤ)
  := sorry
end index_of_not_in_subrange_Why3_ide_VCindex_of_not_in_subrange_assert_rte_signed_overflow_goal5
