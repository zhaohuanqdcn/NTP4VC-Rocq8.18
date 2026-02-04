import Why3.Base
import Why3.Qed.Qed
import frama_c.airborne.float_quat_of_rmat.lib.lean.S10_RealRMat_s.S10_RealRMat_s
import Why3.Memory.Memory
import frama_c.airborne.float_quat_of_rmat.lib.lean.Axiomatic17.Axiomatic17
import frama_c.airborne.float_quat_of_rmat.lib.lean.Compound.Compound
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_of_rmat.lib.lean.S11_RealQuat_s.S11_RealQuat_s
import Why3.Square.Square
open Classical
open Lean4Why3
namespace Axiomatic19
noncomputable def l_trace_1' (rmat_0 : S10_RealRMat_s.s10_realrmat_s) := S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a00 rmat_0 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a11 rmat_0 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a22 rmat_0
noncomputable def l_trace_2' (mflt_0 : Memory.addr -> ℝ) (rmat_0 : Memory.addr) := l_trace_1' (Axiomatic17.l_l_rmat_of_floatrmat mflt_0 rmat_0)
noncomputable def l_l_floatquat_of_rmat_trace_pos_1' (rmat_0 : S10_RealRMat_s.s10_realrmat_s) := let r : ℝ := (1 : ℝ) / (2 : ℝ) / Real.sqrt ((1 : ℝ) + l_trace_1' rmat_0); S11_RealQuat_s.s11_realquat_s.mk ((1 : ℝ) / (4 : ℝ) / r) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a21 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a12 rmat_0) * r) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a02 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a20 rmat_0) * r) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a10 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a01 rmat_0) * r)
noncomputable def l_l_floatquat_of_rmat_trace_pos_t (mflt_0 : Memory.addr -> ℝ) (rmat_0 : Memory.addr) := l_l_floatquat_of_rmat_trace_pos_1' (Axiomatic17.l_transpose (Axiomatic17.l_l_rmat_of_floatrmat mflt_0 rmat_0))
noncomputable def l_l_floatquat_of_rmat_0_max_1' (rmat_0 : S10_RealRMat_s.s10_realrmat_s) := let r : ℝ := Real.sqrt ((1 : ℝ) + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a00 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a11 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a22 rmat_0); let r_1 : ℝ := (2 : ℝ) * r; S11_RealQuat_s.s11_realquat_s.mk ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a21 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a12 rmat_0) / r_1) ((1 : ℝ) / (2 : ℝ) * r) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a01 rmat_0 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a10 rmat_0) / r_1) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a02 rmat_0 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a20 rmat_0) / r_1)
noncomputable def l_l_floatquat_of_rmat_0_max_t (mflt_0 : Memory.addr -> ℝ) (rmat_0 : Memory.addr) := l_l_floatquat_of_rmat_0_max_1' (Axiomatic17.l_transpose (Axiomatic17.l_l_rmat_of_floatrmat mflt_0 rmat_0))
noncomputable def l_l_floatquat_of_rmat_1_max_1' (rmat_0 : S10_RealRMat_s.s10_realrmat_s) := let r : ℝ := Real.sqrt ((1 : ℝ) + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a11 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a00 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a22 rmat_0); let r_1 : ℝ := (2 : ℝ) * r; S11_RealQuat_s.s11_realquat_s.mk ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a02 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a20 rmat_0) / r_1) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a01 rmat_0 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a10 rmat_0) / r_1) ((1 : ℝ) / (2 : ℝ) * r) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a12 rmat_0 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a21 rmat_0) / r_1)
noncomputable def l_l_floatquat_of_rmat_1_max_t (mflt_0 : Memory.addr -> ℝ) (rmat_0 : Memory.addr) := l_l_floatquat_of_rmat_1_max_1' (Axiomatic17.l_transpose (Axiomatic17.l_l_rmat_of_floatrmat mflt_0 rmat_0))
noncomputable def l_l_floatquat_of_rmat_2_max_1' (rmat_0 : S10_RealRMat_s.s10_realrmat_s) := let r : ℝ := Real.sqrt ((1 : ℝ) + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a22 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a00 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a11 rmat_0); let r_1 : ℝ := (2 : ℝ) * r; S11_RealQuat_s.s11_realquat_s.mk ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a10 rmat_0 - S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a01 rmat_0) / r_1) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a02 rmat_0 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a20 rmat_0) / r_1) ((S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a12 rmat_0 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a21 rmat_0) / r_1) ((1 : ℝ) / (2 : ℝ) * r)
noncomputable def l_l_floatquat_of_rmat_2_max_t (mflt_0 : Memory.addr -> ℝ) (rmat_0 : Memory.addr) := l_l_floatquat_of_rmat_2_max_1' (Axiomatic17.l_transpose (Axiomatic17.l_l_rmat_of_floatrmat mflt_0 rmat_0))
end Axiomatic19
