import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_free_Why3_ide_VCmemb_free_assert_rte_mem_access_goal1
theorem goal1 (a : Memory.addr) (a_1 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.framed t_3) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_2) (fact5 : Cint.is_uint16 (t_1 (Memory.shift a_1 (1 : ℤ)))) (fact6 : Axiomatic13.p_valid_memb t t_3 t_1 a_1) : Memory.valid_rd t (Memory.shift a_1 (3 : ℤ)) (1 : ℤ)
  := sorry
end memb_free_Why3_ide_VCmemb_free_assert_rte_mem_access_goal1
