import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_numfree_Why3_ide_VCmemb_numfree_loop_inv_3_established_goal5
theorem goal5 (a : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.framed t_3) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_2) (fact4 : Cint.is_uint16 (t_1 (Memory.shift a (1 : ℤ)))) (fact5 : Axiomatic13.p_valid_memb t t_3 t_1 a) : A_OccArray.l_occ_a t_2 (0 : ℤ) (t_3 (Memory.shift a (2 : ℤ))) (0 : ℤ) (0 : ℤ) = (0 : ℤ)
  := sorry
end memb_numfree_Why3_ide_VCmemb_numfree_loop_inv_3_established_goal5
