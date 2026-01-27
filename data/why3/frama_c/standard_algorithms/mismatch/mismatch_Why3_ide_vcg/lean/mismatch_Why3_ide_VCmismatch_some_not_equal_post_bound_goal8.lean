import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.mismatch.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.mismatch.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace mismatch_Why3_ide_VCmismatch_some_not_equal_post_bound_goal8
theorem goal8 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i_1 ≤ i) (fact1 : (0 : ℤ) ≤ i_1) (fact2 : i ≤ i_1) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact5 : Memory.linked t) (fact6 : Cint.is_uint32 i) (fact7 : Cint.is_uint32 i_1) (fact8 : Cint.is_sint32 (t_1 (Memory.shift a i_1))) (fact9 : Cint.is_sint32 (t_1 (Memory.shift a_1 i_1))) (fact10 : ¬Axiomatic.p_equalranges_1' t_1 t_1 a_1 i a) (fact11 : Axiomatic.p_equalranges_1' t_1 t_1 a_1 i_1 a) (fact12 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : ¬Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i
  := sorry
end mismatch_Why3_ide_VCmismatch_some_not_equal_post_bound_goal8
