import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
open Classical
open Lean4Why3
namespace index_of_Why3_ide_VCindex_of_post_part1_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ i_1) (fact2 : i ≤ i_1) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact5 : Memory.framed t_1) (fact6 : Memory.linked t) (fact7 : Cint.is_sint32 i) (fact8 : Cint.is_sint32 i_1) (fact9 : i_1 ≤ i → Memory.valid_rw t (Memory.shift a_1 i_1) (i - i_1)) : A_Index_of_item.l_index_of t_1 a a_1 i_1 i = i
  := sorry
end index_of_Why3_ide_VCindex_of_post_part1_goal0
