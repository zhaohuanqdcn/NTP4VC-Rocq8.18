import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace list_length_Why3_ide_VClist_length_loop_inv_2_preserved_goal5
theorem goal5 (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i_2 : ℤ) (fact0 : ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1) (fact1 : i_1 ≤ i) (fact2 : (0 : ℤ) ≤ i_1) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact5 : Memory.framed t_1) (fact6 : Memory.linked t) (fact7 : Cint.is_sint32 i) (fact8 : Cint.is_sint32 i_1) (fact9 : Cint.is_sint32 i_2) (fact10 : Memory.valid_rw t a (1 : ℤ)) (fact11 : Cint.is_sint32 ((1 : ℤ) + i_1)) (fact12 : Axiomatic.p_linked_n t t_1 (t_1 a) a_2 i_2 i (Memory.addr.mk (0 : ℤ) (0 : ℤ))) (fact13 : Axiomatic.p_linked_n t t_1 a_1 a_2 (i_1 + i_2) (i - i_1) (Memory.addr.mk (0 : ℤ) (0 : ℤ))) : Axiomatic.p_linked_n t t_1 (t_1 (Memory.shift a_1 (0 : ℤ))) a_2 ((1 : ℤ) + i_1 + i_2) (i - (1 : ℤ) - i_1) (Memory.addr.mk (0 : ℤ) (0 : ℤ))
  := sorry
end list_length_Why3_ide_VClist_length_loop_inv_2_preserved_goal5
