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
namespace float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_2_preserved_goal2
theorem goal2 (r : ℝ) (r_1 : ℝ) (i_2 : ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (fact0 : (0 : ℝ) ≤ r) (fact1 : r ≤ r_1) (fact2 : i_2 ≤ i) (fact3 : i_3 ≤ i_1) (fact4 : (0 : ℤ) ≤ i_2) (fact5 : i ≤ i_2) (fact6 : (0 : ℤ) ≤ i_3) (fact7 : i_3 < i_1) (fact8 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact9 : Memory.framed t_1) (fact10 : Memory.linked t) (fact11 : Cint.is_sint32 i) (fact12 : Cint.is_sint32 i_1) (fact13 : Cint.is_sint32 i_2) (fact14 : Cint.is_sint32 i_3) (fact15 : Cfloat.is_float32 r) (fact16 : Cfloat.is_float32 r_1) (fact17 : Axiomatic15.p_rvalid_float_mat_2' t t_1 a i_1 i) : (0 : ℝ) ≤ r_1
  := sorry
end float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_2_preserved_goal2
