import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_vmult.lib.lean.S10_RealRMat_s.S10_RealRMat_s
import frama_c.airborne.float_rmat_vmult.lib.lean.Compound.Compound
import frama_c.airborne.float_rmat_vmult.lib.lean.S9_RealVect3_s.S9_RealVect3_s
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
open Classical
open Lean4Why3
namespace Axiomatic17
noncomputable def l_l_rmat_of_floatrmat (mflt_0 : Memory.addr -> ℝ) (rmat_0 : Memory.addr) := let a : Memory.addr := Memory.shift rmat_0 (0 : ℤ); S10_RealRMat_s.s10_realrmat_s.mk (mflt_0 (Memory.shift a (0 : ℤ))) (mflt_0 (Memory.shift a (1 : ℤ))) (mflt_0 (Memory.shift a (2 : ℤ))) (mflt_0 (Memory.shift a (3 : ℤ))) (mflt_0 (Memory.shift a (4 : ℤ))) (mflt_0 (Memory.shift a (5 : ℤ))) (mflt_0 (Memory.shift a (6 : ℤ))) (mflt_0 (Memory.shift a (7 : ℤ))) (mflt_0 (Memory.shift a (8 : ℤ)))
noncomputable def l_mult_realrmat_realvect3 (rm_0 : S10_RealRMat_s.s10_realrmat_s) (v : S9_RealVect3_s.s9_realvect3_s) := let r : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_x v; let r_1 : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_y v; let r_2 : ℝ := S9_RealVect3_s.s9_realvect3_s.f9_realvect3_s_z v; S9_RealVect3_s.s9_realvect3_s.mk (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a00 rm_0 * r + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a01 rm_0 * r_1 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a02 rm_0 * r_2) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a10 rm_0 * r + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a11 rm_0 * r_1 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a12 rm_0 * r_2) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a20 rm_0 * r + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a21 rm_0 * r_1 + S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a22 rm_0 * r_2)
end Axiomatic17
