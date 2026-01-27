import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.mismatch.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.mismatch.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace mismatch_Why3_ide_VCmismatch_loop_inv_equal_established_goal3
theorem goal3 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact5 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : Axiomatic.p_equalranges_1' t_1 t_1 a_1 (0 : ℤ) a
  := sorry
end mismatch_Why3_ide_VCmismatch_loop_inv_equal_established_goal3
