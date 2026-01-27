import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.lower_bound.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.lower_bound.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace lower_bound_Why3_ide_VClower_bound_loop_inv_right_established_goal7
theorem goal7 (a : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i_1) (fact3 : Cint.is_sint32 i) (fact4 : Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_1) (fact5 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) : Axiomatic.p_lowerbound_1' t_1 a i_1 i_1 i
  := sorry
end lower_bound_Why3_ide_VClower_bound_loop_inv_right_established_goal7
