import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_inv_Why3_ide_VCmemchr_inv_call_check_bytes8_0_pre_goal0
theorem goal0 (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (a : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact1 : i ≤ (16 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint64 i) (fact4 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i) : Memory.valid_rd t (Memory.shift a (0 : ℤ)) (Cint.to_uint32 i)
  := sorry
end memchr_inv_Why3_ide_VCmemchr_inv_call_check_bytes8_0_pre_goal0
