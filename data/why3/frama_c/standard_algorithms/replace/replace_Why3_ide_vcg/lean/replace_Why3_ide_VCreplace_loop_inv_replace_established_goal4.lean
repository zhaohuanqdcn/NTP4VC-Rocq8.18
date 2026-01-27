import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.replace.lib.lean.Compound.Compound
import frama_c.standard_algorithms.replace.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace replace_Why3_ide_VCreplace_loop_inv_replace_established_goal4
theorem goal4 (a : Memory.addr) (t : ℤ -> ℤ) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i_2) (fact3 : Cint.is_sint32 i) (fact4 : Cint.is_sint32 i_1) (fact5 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_2) : Axiomatic.p_replace_2' t_1 t_1 a (0 : ℤ) i_1 i
  := sorry
end replace_Why3_ide_VCreplace_loop_inv_replace_established_goal4
