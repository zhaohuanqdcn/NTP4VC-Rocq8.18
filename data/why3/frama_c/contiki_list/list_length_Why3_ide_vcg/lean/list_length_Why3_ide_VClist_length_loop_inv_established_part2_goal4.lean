import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace list_length_Why3_ide_VClist_length_loop_inv_established_part2_goal4
theorem goal4 (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.framed t_1) (fact3 : Memory.linked t) (fact4 : Cint.is_sint32 i) (fact5 : Cint.is_sint32 i_1) (fact6 : Memory.valid_rw t a (1 : ℤ)) (fact7 : Axiomatic.p_linked_n t t_1 (t_1 a) a_1 i_1 i (Memory.addr.mk (0 : ℤ) (0 : ℤ))) : (0 : ℤ) ≤ i
  := sorry
end list_length_Why3_ide_VClist_length_loop_inv_established_part2_goal4
