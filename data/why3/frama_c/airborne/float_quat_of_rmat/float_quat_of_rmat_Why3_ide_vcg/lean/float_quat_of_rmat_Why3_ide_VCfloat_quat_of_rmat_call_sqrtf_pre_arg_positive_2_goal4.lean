import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_of_rmat.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_of_rmat.lib.lean.Compound.Compound
import frama_c.airborne.float_quat_of_rmat.lib.lean.Axiomatic17.Axiomatic17
import frama_c.airborne.float_quat_of_rmat.lib.lean.S10_RealRMat_s.S10_RealRMat_s
open Classical
open Lean4Why3
namespace float_quat_of_rmat_Why3_ide_VCfloat_quat_of_rmat_call_sqrtf_pre_arg_positive_2_goal4
theorem goal4 (a : Memory.addr) (t_1 : Memory.addr -> ℝ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let r : ℝ := t_1 (Memory.shift a_2 (4 : ℤ)); let r_1 : ℝ := t_1 (Memory.shift a_2 (0 : ℤ)); let r_2 : ℝ := t_1 (Memory.shift a_2 (8 : ℤ)); let r_3 : ℝ := r_1 + r + r_2; let a_3 : S10_RealRMat_s.s10_realrmat_s := Axiomatic17.l_l_rmat_of_floatrmat t_1 a; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → r < r_1 → r_2 < r_1 → r_3 ≤ (0 : ℝ) → Memory.linked t → Memory.valid_rw t a_1 (4 : ℤ) → Axiomatic15.p_rvalid_floatrmat t t_1 a → Memory.separated a (9 : ℤ) a_1 (4 : ℤ) → Axiomatic17.p_rotation_matrix a_3 → Axiomatic17.p_special_orthogonal a_3 → Cfloat.is_float32 r_1 → Cfloat.is_float32 r → Cfloat.is_float32 (t_1 (Memory.shift a_2 (5 : ℤ))) → Cfloat.is_float32 (t_1 (Memory.shift a_2 (7 : ℤ))) → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_3 → (0 : ℝ) ≤ r_1 + -r + -r_2 + (1 : ℝ)
  := sorry
end float_quat_of_rmat_Why3_ide_VCfloat_quat_of_rmat_call_sqrtf_pre_arg_positive_2_goal4
