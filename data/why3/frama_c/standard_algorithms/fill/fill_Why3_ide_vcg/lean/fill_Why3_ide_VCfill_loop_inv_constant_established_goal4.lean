import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.fill.lib.lean.Compound.Compound
import frama_c.standard_algorithms.fill.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace fill_Why3_ide_VCfill_loop_inv_constant_established_goal4
theorem goal4 (a : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i_1) (fact3 : Cint.is_sint32 i) (fact4 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1) : Axiomatic.p_constantrange t_1 a (0 : ℤ) (0 : ℤ) i
  := sorry
end fill_Why3_ide_VCfill_loop_inv_constant_established_goal4
