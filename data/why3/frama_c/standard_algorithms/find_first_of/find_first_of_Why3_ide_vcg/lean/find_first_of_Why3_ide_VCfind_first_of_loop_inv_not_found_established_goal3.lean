import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_first_of.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_first_of.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_first_of_Why3_ide_VCfind_first_of_loop_inv_not_found_established_goal3
theorem goal3 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i) (fact4 : Cint.is_uint32 i_1) (fact5 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact6 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) : ¬Axiomatic.p_hasvalueof t_1 a_1 (0 : ℤ) a i
  := sorry
end find_first_of_Why3_ide_VCfind_first_of_loop_inv_not_found_established_goal3
