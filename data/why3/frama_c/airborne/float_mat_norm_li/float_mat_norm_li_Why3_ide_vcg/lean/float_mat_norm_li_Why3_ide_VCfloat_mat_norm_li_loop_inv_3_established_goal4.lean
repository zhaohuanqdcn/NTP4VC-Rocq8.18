import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_mat_norm_li.lib.lean.Axiomatic15.Axiomatic15
import frama_c.airborne.float_mat_norm_li.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_3_established_goal4
theorem goal4 (r : ℝ) (i_2 : ℤ) (i_1 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (fact0 : (0 : ℝ) ≤ r) (fact1 : i_2 ≤ i_1) (fact2 : (0 : ℤ) ≤ i_2) (fact3 : i_2 < i_1) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : Memory.framed t_1) (fact6 : Memory.linked t) (fact7 : Cint.is_sint32 i) (fact8 : Cint.is_sint32 i_1) (fact9 : Cint.is_sint32 i_2) (fact10 : Cfloat.is_float32 r) (fact11 : Axiomatic15.p_rvalid_float_mat_2' t t_1 a i_1 i) : (0 : ℤ) ≤ i
  := sorry
end float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_3_established_goal4
