import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find2.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.find2.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_Why3_ide_VCfind_some_post_bound_goal7
theorem goal7 (i_2 : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i_2 ≤ i_1) (fact1 : (0 : ℤ) ≤ i_2) (fact2 : i_1 ≤ i_2) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.linked t) (fact5 : Cint.is_uint32 i_1) (fact6 : Cint.is_uint32 i_2) (fact7 : Cint.is_sint32 i) (fact8 : Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i_1 i) (fact9 : ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i_2 i) (fact10 : Cint.is_sint32 (t_1 (Memory.shift a i_2))) : ¬Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1
  := sorry
end find_Why3_ide_VCfind_some_post_bound_goal7
