import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_comp_norm_shortest.lib.lean.S12_RealQuatVect_s.S12_RealQuatVect_s
import frama_c.airborne.float_quat_comp_norm_shortest.lib.lean.S9_RealVect3_s.S9_RealVect3_s
import frama_c.airborne.float_quat_comp_norm_shortest.lib.lean.Compound.Compound
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_comp_norm_shortest.lib.lean.Axiomatic16.Axiomatic16
open Classical
open Lean4Why3
namespace Axiomatic19
noncomputable def l_l_quatvect_of_floatquat (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) := S12_RealQuatVect_s.s12_realquatvect_s.mk (mflt_0 (Memory.shift q (0 : ℤ))) (S9_RealVect3_s.s9_realvect3_s.mk (mflt_0 (Memory.shift q (1 : ℤ))) (mflt_0 (Memory.shift q (2 : ℤ))) (mflt_0 (Memory.shift q (3 : ℤ))))
noncomputable def l_mult_realquatvect (q1_0 : S12_RealQuatVect_s.s12_realquatvect_s) (q2_0 : S12_RealQuatVect_s.s12_realquatvect_s) := let a : S9_RealVect3_s.s9_realvect3_s := S12_RealQuatVect_s.s12_realquatvect_s.f12_realquatvect_s_vect q1_0; let a_1 : S9_RealVect3_s.s9_realvect3_s := S12_RealQuatVect_s.s12_realquatvect_s.f12_realquatvect_s_vect q2_0; let r : ℝ := S12_RealQuatVect_s.s12_realquatvect_s.f12_realquatvect_s_scalar q1_0; let r_1 : ℝ := S12_RealQuatVect_s.s12_realquatvect_s.f12_realquatvect_s_scalar q2_0; S12_RealQuatVect_s.s12_realquatvect_s.mk (-Axiomatic16.l_scalar_product a a_1 + r * r_1) (Axiomatic16.l_add_realvect3 (Axiomatic16.l_add_realvect3 (Axiomatic16.l_mult_scalar_1' r a_1) (Axiomatic16.l_mult_scalar_1' r_1 a)) (Axiomatic16.l_cross_product a a_1))
end Axiomatic19
