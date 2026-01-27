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
namespace float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_preserved_goal0
theorem goal0 (r : ℝ) (i_2 : ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (fact0 : (0 : ℝ) ≤ r) (fact1 : i_2 ≤ i) (fact2 : i_3 ≤ i_1) (fact3 : (0 : ℤ) ≤ i_2) (fact4 : i ≤ i_2) (fact5 : (0 : ℤ) ≤ i_3) (fact6 : i_3 < i_1) (fact7 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact8 : Memory.framed t_1) (fact9 : Memory.linked t) (fact10 : Cint.is_sint32 i) (fact11 : Cint.is_sint32 i_1) (fact12 : Cint.is_sint32 i_2) (fact13 : Cint.is_sint32 i_3) (fact14 : Cfloat.is_float32 r) (fact15 : Cint.is_sint32 ((1 : ℤ) + i_3)) (fact16 : Axiomatic15.p_rvalid_float_mat_2' t t_1 a i_1 i) : -(1 : ℤ) ≤ i_3
  := sorry
end float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_preserved_goal0
