import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace occ_a_split_Why3_ide_VCocc_a_split_loop_inv_2_established_goal2
theorem goal2 (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (i_2 : ℤ) (fact0 : i_3 ≤ i) (fact1 : i_1 ≤ i_3) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Memory.sconst t) (fact4 : Cint.is_sint32 i) (fact5 : Cint.is_sint32 i_1) (fact6 : Cint.is_sint32 i_2) (fact7 : Cint.is_sint32 i_3) : A_OccArray.l_occ_a t i_2 a i_3 i_3 = (0 : ℤ)
  := sorry
end occ_a_split_Why3_ide_VCocc_a_split_loop_inv_2_established_goal2
