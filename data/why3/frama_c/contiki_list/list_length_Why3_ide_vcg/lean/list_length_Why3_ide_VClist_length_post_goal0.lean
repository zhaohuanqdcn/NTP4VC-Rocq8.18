import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace list_length_Why3_ide_VClist_length_post_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i_2 : ℤ) (fact0 : i_1 ≤ i) (fact1 : (0 : ℤ) ≤ i_1) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact4 : Memory.framed t_1) (fact5 : Memory.linked t) (fact6 : Cint.is_sint32 i) (fact7 : Cint.is_sint32 i_1) (fact8 : Cint.is_sint32 i_2) (fact9 : Memory.valid_rw t a (1 : ℤ)) (fact10 : Axiomatic.p_linked_n t t_1 (t_1 a) a_1 i_2 i (Memory.addr.mk (0 : ℤ) (0 : ℤ))) (fact11 : Axiomatic.p_linked_n t t_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ)) a_1 (i_1 + i_2) (i - i_1) (Memory.addr.mk (0 : ℤ) (0 : ℤ))) : i_1 = i
  := sorry
end list_length_Why3_ide_VClist_length_post_goal0
