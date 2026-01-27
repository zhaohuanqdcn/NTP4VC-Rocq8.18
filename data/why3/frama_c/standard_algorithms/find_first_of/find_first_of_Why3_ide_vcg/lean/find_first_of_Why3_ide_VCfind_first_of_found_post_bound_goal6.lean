import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_first_of.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_first_of.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_first_of_Why3_ide_VCfind_first_of_found_post_bound_goal6
theorem goal6 (i_2 : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i_2 ≤ i_1) (fact1 : (0 : ℤ) ≤ i_2) (fact2 : i_1 ≤ i_2) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact5 : Memory.linked t) (fact6 : Cint.is_uint32 i) (fact7 : Cint.is_uint32 i_1) (fact8 : Cint.is_uint32 i_2) (fact9 : Axiomatic.p_hasvalueof t_1 a_1 i_1 a i) (fact10 : ¬Axiomatic.p_hasvalueof t_1 a_1 i_2 a i) (fact11 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : ¬Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1
  := sorry
end find_first_of_Why3_ide_VCfind_first_of_found_post_bound_goal6
