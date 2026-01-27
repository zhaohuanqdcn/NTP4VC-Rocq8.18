import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_end.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_end.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_end_Why3_ide_VCfind_end_loop_inv_result_established_goal3
theorem goal3 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i_1) (fact1 : i_1 ≤ i) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact4 : Memory.linked t) (fact5 : Cint.is_uint32 i) (fact6 : Cint.is_uint32 i_1) (fact7 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) (fact8 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) (i_1 - (1 : ℤ)) a i_1
  := sorry
end find_end_Why3_ide_VCfind_end_loop_inv_result_established_goal3
