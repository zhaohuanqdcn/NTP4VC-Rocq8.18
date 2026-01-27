import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_loop_inv_3_established_goal7
theorem goal7 (a_3 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_4 : Memory.addr) (a_2 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint64 i) (fact3 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact4 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : Memory.addr.offset a_4 = Memory.addr.offset a_2
  := sorry
end memchr_Why3_ide_VCmemchr_loop_inv_3_established_goal7
