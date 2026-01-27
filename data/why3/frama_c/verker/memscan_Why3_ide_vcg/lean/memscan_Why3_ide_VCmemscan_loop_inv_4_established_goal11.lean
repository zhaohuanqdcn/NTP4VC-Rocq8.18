import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memscan_Why3_ide_VCmemscan_loop_inv_4_established_goal11
theorem goal11 (a_5 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_5) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint64 i) (fact3 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact4 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : Memory.addr_le a_2 a_4 ∧ Memory.addr_le a_4 (Memory.shift a_3 i)
  := sorry
end memscan_Why3_ide_VCmemscan_loop_inv_4_established_goal11
