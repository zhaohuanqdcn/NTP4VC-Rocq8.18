import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace occ_a_split_Why3_ide_VCocc_a_split_assert_rte_signed_overflow_goal3
theorem goal3 (t : Memory.addr -> ℤ) (i_3 : ℤ) (a : Memory.addr) (i_2 : ℤ) (i_4 : ℤ) (i_1 : ℤ) (i : ℤ) (fact0 : A_OccArray.l_occ_a t i_3 a i_2 i_4 + A_OccArray.l_occ_a t i_3 a i_4 i_1 = A_OccArray.l_occ_a t i_3 a i_2 i_1) (fact1 : i_1 ≤ i) (fact2 : i_4 ≤ i) (fact3 : i_1 < i) (fact4 : i_4 ≤ i_1) (fact5 : i_2 ≤ i_4) (fact6 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact7 : Memory.sconst t) (fact8 : Cint.is_sint32 i) (fact9 : Cint.is_sint32 i_1) (fact10 : Cint.is_sint32 i_2) (fact11 : Cint.is_sint32 i_3) (fact12 : Cint.is_sint32 i_4) : i_1 ≤ (2147483646 : ℤ)
  := sorry
end occ_a_split_Why3_ide_VCocc_a_split_assert_rte_signed_overflow_goal3
