import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find2.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.find2.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_Why3_ide_VCfind_loop_inv_not_found_established_goal3
theorem goal3 (a : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i_1) (fact3 : Cint.is_sint32 i) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) : ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) (0 : ℤ) i
  := sorry
end find_Why3_ide_VCfind_loop_inv_not_found_established_goal3
