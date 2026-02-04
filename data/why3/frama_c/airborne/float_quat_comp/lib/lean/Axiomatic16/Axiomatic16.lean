import Why3.Base
import Why3.Qed.Qed
import frama_c.airborne.float_quat_comp.lib.lean.S9_RealVect3_s.S9_RealVect3_s
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
open Classical
open Lean4Why3
namespace Axiomatic16
noncomputable def l_scalar_product (v1_0 : S9_RealVect3_s.s9_realvect3_s) (v2_0 : S9_RealVect3_s.s9_realvect3_s) := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_x v1_0 * S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_x v2_0 + S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_y v1_0 * S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_y v2_0 + S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_z v1_0 * S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_z v2_0
noncomputable def l_mult_scalar_1' (scal_0 : ℝ) (v : S9_RealVect3_s.s9_realvect3_s) := S9_RealVect3_s.s9_realvect3_s.mk (scal_0 * S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_x v) (scal_0 * S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_y v) (scal_0 * S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_z v)
noncomputable def l_add_realvect3 (v1_0 : S9_RealVect3_s.s9_realvect3_s) (v2_0 : S9_RealVect3_s.s9_realvect3_s) := S9_RealVect3_s.s9_realvect3_s.mk (S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_x v1_0 + S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_x v2_0) (S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_y v1_0 + S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_y v2_0) (S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_z v1_0 + S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_z v2_0)
noncomputable def l_cross_product (v1_0 : S9_RealVect3_s.s9_realvect3_s) (v2_0 : S9_RealVect3_s.s9_realvect3_s) := let r : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_z v1_0; let r_1 : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_y v2_0; let r_2 : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_y v1_0; let r_3 : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_z v2_0; let r_4 : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_x v1_0; let r_5 : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_x v2_0; S9_RealVect3_s.s9_realvect3_s.mk (-(r * r_1) + r_2 * r_3) (-(r_4 * r_3) + r * r_5) (-(r_2 * r_5) + r_4 * r_1)
end Axiomatic16
