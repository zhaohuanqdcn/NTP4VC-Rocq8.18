import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.airborne.float_mat_norm_li.lib.lean.Axiomatic15.Axiomatic15
import frama_c.airborne.float_mat_norm_li.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_established_goal1
theorem goal1 (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.framed t_1) (fact2 : Memory.linked t) (fact3 : Cint.is_sint32 i) (fact4 : Cint.is_sint32 i_1) (fact5 : Axiomatic15.p_rvalid_float_mat_2' t t_1 a i_1 i) : (0 : ℤ) ≤ i_1
  := sorry
end float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_established_goal1
