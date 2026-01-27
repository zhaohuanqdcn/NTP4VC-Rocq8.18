import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcmp_Why3_ide_VCmemcmp_loop_inv_3_established_goal7
theorem goal7 (a_5 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_11 : Memory.addr) (a_10 : Memory.addr) (a_9 : Memory.addr) (a_8 : Memory.addr) (a_15 : Memory.addr) (a_16 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (a_12 : Memory.addr) (a_14 : Memory.addr) (a_13 : Memory.addr) (fact0 : (Memory.addr.base a_5 = Memory.addr.base a_4) = (Memory.addr.base a_3 = Memory.addr.base a_2)) (fact1 : (Memory.addr.base a_11 = Memory.addr.base a_10) = (Memory.addr.base a_9 = Memory.addr.base a_8)) (fact2 : Memory.region (Memory.addr.base a_15) ≤ (0 : ℤ)) (fact3 : Memory.region (Memory.addr.base a_16) ≤ (0 : ℤ)) (fact4 : Memory.linked t) (fact5 : Cint.is_uint64 i) (fact6 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact7 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) (fact8 : Memory.valid_rd t (Memory.shift a_6 (0 : ℤ)) i) (fact9 : Memory.valid_rd t (Memory.shift a_7 (0 : ℤ)) i) : Memory.addr_le a_12 a_14 ∧ Memory.addr_le a_14 (Memory.shift a_13 i)
  := sorry
end memcmp_Why3_ide_VCmemcmp_loop_inv_3_established_goal7
