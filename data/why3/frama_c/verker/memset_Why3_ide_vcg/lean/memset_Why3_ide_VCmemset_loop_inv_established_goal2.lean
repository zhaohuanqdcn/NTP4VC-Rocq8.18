import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memset_Why3_ide_VCmemset_loop_inv_established_goal2
theorem goal2 (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Cint.is_uint64 i) (fact4 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : (0 : ℤ) ≤ i
  := sorry
end memset_Why3_ide_VCmemset_loop_inv_established_goal2
