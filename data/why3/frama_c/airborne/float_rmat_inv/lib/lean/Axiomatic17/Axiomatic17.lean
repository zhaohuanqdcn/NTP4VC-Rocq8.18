import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_inv.lib.lean.S10_RealRMat_s.S10_RealRMat_s
import frama_c.airborne.float_rmat_inv.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic17
noncomputable def l_l_rmat_of_floatrmat (mflt_0 : Memory.addr -> ℝ) (rmat_0 : Memory.addr) := let a : Memory.addr := Memory.shift rmat_0 (0 : ℤ); S10_RealRMat_s.s10_realrmat_s.mk (mflt_0 (Memory.shift a (0 : ℤ))) (mflt_0 (Memory.shift a (1 : ℤ))) (mflt_0 (Memory.shift a (2 : ℤ))) (mflt_0 (Memory.shift a (3 : ℤ))) (mflt_0 (Memory.shift a (4 : ℤ))) (mflt_0 (Memory.shift a (5 : ℤ))) (mflt_0 (Memory.shift a (6 : ℤ))) (mflt_0 (Memory.shift a (7 : ℤ))) (mflt_0 (Memory.shift a (8 : ℤ)))
noncomputable def l_transpose (rmat_0 : S10_RealRMat_s.s10_realrmat_s) := S10_RealRMat_s.s10_realrmat_s.mk (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a00 rmat_0) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a10 rmat_0) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a20 rmat_0) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a01 rmat_0) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a11 rmat_0) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a21 rmat_0) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a02 rmat_0) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a12 rmat_0) (S10_RealRMat_s.s10_realrmat_s.f10_realrmat_s_a22 rmat_0)
end Axiomatic17
