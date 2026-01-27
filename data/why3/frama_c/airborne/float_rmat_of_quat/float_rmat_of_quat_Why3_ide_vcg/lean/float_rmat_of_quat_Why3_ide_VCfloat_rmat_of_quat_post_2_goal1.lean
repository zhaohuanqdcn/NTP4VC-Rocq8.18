import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_of_quat.lib.lean.Axiomatic19.Axiomatic19
import frama_c.airborne.float_rmat_of_quat.lib.lean.S10_RealRMat_s.S10_RealRMat_s
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_of_quat.lib.lean.Compound.Compound
import frama_c.airborne.float_rmat_of_quat.lib.lean.Axiomatic15.Axiomatic15
import frama_c.airborne.float_rmat_of_quat.lib.lean.Axiomatic17.Axiomatic17
open Classical
open Lean4Why3
namespace float_rmat_of_quat_Why3_ide_VCfloat_rmat_of_quat_post_2_goal1
theorem goal1 (t_1 : Memory.addr -> ℝ) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a_1 (0 : ℤ)); let r_1 : ℝ := t_1 (Memory.shift a_1 (1 : ℤ)); let r_2 : ℝ := t_1 (Memory.shift a_1 (2 : ℤ)); let r_3 : ℝ := t_1 (Memory.shift a_1 (3 : ℤ)); let r_4 : ℝ := (2 : ℝ) * r; let r_5 : ℝ := (2 : ℝ) * r_1; let r_6 : ℝ := (2 : ℝ) * r_3; let r_7 : ℝ := r_4 * r_1; let r_8 : ℝ := r_4 * r_2; let r_9 : ℝ := r_4 * r_3; let r_10 : ℝ := r_5 * r_2; let r_11 : ℝ := r_5 * r_3; let r_12 : ℝ := r_2 * r_6; let r_13 : ℝ := r_4 * r + -(1 : ℝ); let a_2 : Memory.addr := Memory.shift a (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Axiomatic19.p_unitary_quaternion_1' t_1 a_1 → Memory.valid_rw t a (9 : ℤ) → Axiomatic15.p_rvalid_floatquat t t_1 a_1 → Memory.separated a (9 : ℤ) a_1 (4 : ℤ) → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_3 → Cfloat.is_float32 r_4 → Cfloat.is_float32 r_5 → Cfloat.is_float32 r_6 → Cfloat.is_float32 r_7 → Cfloat.is_float32 r_8 → Cfloat.is_float32 r_9 → Cfloat.is_float32 r_10 → Cfloat.is_float32 r_11 → Cfloat.is_float32 r_12 → Cfloat.is_float32 r_13 → Axiomatic17.p_rotation_matrix (Axiomatic17.l_l_rmat_of_floatrmat (Function.update (Function.update (Function.update (Function.update (Function.update (Function.update (Function.update (Function.update (Function.update t_1 (Memory.shift a_2 (0 : ℤ)) (r_13 + r_5 * r_1)) (Memory.shift a_2 (1 : ℤ)) (r_10 + r_9)) (Memory.shift a_2 (2 : ℤ)) (r_11 + -r_8)) (Memory.shift a_2 (3 : ℤ)) (r_10 + -r_9)) (Memory.shift a_2 (4 : ℤ)) (r_13 + (2 : ℝ) * r_2 * r_2)) (Memory.shift a_2 (5 : ℤ)) (r_12 + r_7)) (Memory.shift a_2 (6 : ℤ)) (r_11 + r_8)) (Memory.shift a_2 (7 : ℤ)) (r_12 + -r_7)) (Memory.shift a_2 (8 : ℤ)) (r_13 + r_6 * r_3)) a)
  := sorry
end float_rmat_of_quat_Why3_ide_VCfloat_rmat_of_quat_post_2_goal1
