import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_loop_inv_established_goal3
theorem goal3 (a_2 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint64 i) (fact3 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact4 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : (0 : ℤ) ≤ i
  := sorry
end memchr_Why3_ide_VCmemchr_loop_inv_established_goal3
