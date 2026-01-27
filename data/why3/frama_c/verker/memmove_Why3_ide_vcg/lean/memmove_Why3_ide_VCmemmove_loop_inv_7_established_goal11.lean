import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_loop_inv_7_established_goal11
theorem goal11 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Cint.is_uint64 i) (fact5 : ¬Memory.addr_le a_1 a) (fact6 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact7 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i) : (0 : ℤ) ≤ i
  := sorry
end memmove_Why3_ide_VCmemmove_loop_inv_7_established_goal11
