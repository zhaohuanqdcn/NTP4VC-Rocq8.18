import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_of_quat.lib.lean.S10_RealRMat_s.S10_RealRMat_s
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_of_quat.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic19
noncomputable def l_l_rmat_of_floatquat_1' (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) := let r : ℝ := mflt_0 (Memory.shift q (2 : ℤ)); let r_1 : ℝ := r * r; let r_2 : ℝ := -r_1; let r_3 : ℝ := mflt_0 (Memory.shift q (3 : ℤ)); let r_4 : ℝ := r_3 * r_3; let r_5 : ℝ := -r_4; let r_6 : ℝ := mflt_0 (Memory.shift q (0 : ℤ)); let r_7 : ℝ := r_6 * r_6; let r_8 : ℝ := mflt_0 (Memory.shift q (1 : ℤ)); let r_9 : ℝ := r_8 * r_8; let r_10 : ℝ := r_6 * r_3; let r_11 : ℝ := r_8 * r; let r_12 : ℝ := r_6 * r; let r_13 : ℝ := r_8 * r_3; let r_14 : ℝ := -r_9; let r_15 : ℝ := r_6 * r_8; let r_16 : ℝ := r * r_3; S10_RealRMat_s.s10_realrmat_s.mk (r_7 + r_9 - r_1 - r_4) ((2 : ℝ) * (r_11 - r_10)) ((2 : ℝ) * (r_12 + r_13)) ((2 : ℝ) * (r_10 + r_11)) (r_7 + r_1 - r_9 - r_4) ((2 : ℝ) * (r_16 - r_15)) ((2 : ℝ) * (r_13 - r_12)) ((2 : ℝ) * (r_15 + r_16)) (r_7 + r_4 - r_9 - r_1)
noncomputable def p_unitary_quaternion_1' (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) := let r : ℝ := mflt_0 (Memory.shift q (0 : ℤ)); let r_1 : ℝ := mflt_0 (Memory.shift q (1 : ℤ)); let r_2 : ℝ := mflt_0 (Memory.shift q (2 : ℤ)); let r_3 : ℝ := mflt_0 (Memory.shift q (3 : ℤ)); r * r + r_1 * r_1 + r_2 * r_2 + r_3 * r_3 = (1 : ℝ)
end Axiomatic19
