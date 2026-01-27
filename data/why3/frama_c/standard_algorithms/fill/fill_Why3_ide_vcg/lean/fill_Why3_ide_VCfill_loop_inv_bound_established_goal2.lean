import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.fill.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace fill_Why3_ide_VCfill_loop_inv_bound_established_goal2
theorem goal2 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i) (fact3 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : (0 : ℤ) ≤ i
  := sorry
end fill_Why3_ide_VCfill_loop_inv_bound_established_goal2
