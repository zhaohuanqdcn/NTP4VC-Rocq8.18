import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_inv_Why3_ide_VCmemchr_inv_call_check_bytes8_0_pre_4_goal3
theorem goal3 (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) (t_1 : ℤ -> ℤ) (a : Memory.addr) (fact0 : Cint.to_uint32 (Int.tmod (Memory.int_of_addr a_1) (8 : ℤ)) = (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : (17 : ℤ) ≤ i) (fact3 : Memory.linked t) (fact4 : Cint.is_uint64 i) (fact5 : Cint.is_uint64 i_1) (fact6 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i) : Memory.valid_rd t_1 (Memory.shift a (0 : ℤ)) (Cint.to_uint32 (Int.tmod i_1 (8 : ℤ)))
  := sorry
end memchr_inv_Why3_ide_VCmemchr_inv_call_check_bytes8_0_pre_4_goal3
