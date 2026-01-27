import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.upper_bound.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.upper_bound.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace upper_bound_Why3_ide_VCupper_bound_loop_inv_bound_established_goal1
theorem goal1 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i) (fact3 : Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : (0 : ℤ) ≤ i
  := sorry
end upper_bound_Why3_ide_VCupper_bound_loop_inv_bound_established_goal1
