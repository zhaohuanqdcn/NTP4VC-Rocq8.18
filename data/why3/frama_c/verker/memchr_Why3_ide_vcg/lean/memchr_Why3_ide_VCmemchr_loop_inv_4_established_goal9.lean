import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_loop_inv_4_established_goal9
theorem goal9 (a_3 : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i : ℤ) (a_5 : Memory.addr) (a_4 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_sint32 i_1) (fact3 : Cint.is_uint64 i) (fact4 : Memory.addr_lt a_5 a_4) (fact5 : Memory.addr_le a_2 a_5) (fact6 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact7 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : ¬t_1 a_5 = Cint.to_uint8 i_1
  := sorry
end memchr_Why3_ide_VCmemchr_loop_inv_4_established_goal9
