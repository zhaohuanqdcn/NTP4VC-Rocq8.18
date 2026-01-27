import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace linked_n_merge_segment_Why3_ide_VClinked_n_merge_segment_post_part1_goal0
theorem goal0 (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact3 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact4 : Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ)) (fact5 : Memory.framed t_1) (fact6 : Memory.linked t) (fact7 : Cint.is_sint32 i) (fact8 : Cint.is_sint32 i_1) (fact9 : Memory.valid_rw t (Memory.shift a_3 (0 : ℤ)) (2147483646 : ℤ)) (fact10 : Axiomatic.p_linked_n t t_1 a a_3 i_1 (0 : ℤ) a_2) (fact11 : Axiomatic.p_linked_n t t_1 a_2 a_3 i_1 i a_1) : Axiomatic.p_linked_n t t_1 a a_3 i_1 i a_1
  := sorry
end linked_n_merge_segment_Why3_ide_VClinked_n_merge_segment_post_part1_goal0
