import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcpy_Why3_ide_VCmemcpy_loop_inv_2_established_goal4
theorem goal4 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Cint.is_uint64 i) (fact5 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact6 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i) : Memory.addr_le a_1 a_1 ∧ Memory.addr_le a_1 (Memory.shift a_1 i)
  := sorry
end memcpy_Why3_ide_VCmemcpy_loop_inv_2_established_goal4
