import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.reverse.lib.lean.Compound.Compound
import frama_c.standard_algorithms.reverse.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace reverse_Why3_ide_VCreverse_loop_inv_right_established_goal8
theorem goal8 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i) (fact3 : Cint.is_uint32 (Int.tdiv i (2 : ℤ))) (fact4 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : Axiomatic.p_reverse_4' t_1 t_1 a i i (0 : ℤ)
  := sorry
end reverse_Why3_ide_VCreverse_loop_inv_right_established_goal8
